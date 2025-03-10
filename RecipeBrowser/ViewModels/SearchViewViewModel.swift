//
//  SearchViewViewModel.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import Foundation
import SwiftUI

class SearchViewViewModel : ObservableObject {
    @Published var searchResults : MealResponse?
    @Published var favorites: [Meal] = []
    @AppStorage("favorites") var favoritesJSON = "[]"
    
    init() {
        loadFavorites()
    }
    
    func getSearchResults(searchText: String) async throws {
        let endpoint = "https://themealdb.com/api/json/v1/1/search.php?s=\(searchText)"
        
        guard let url = URL(string: endpoint) else {
            throw RecipeError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw RecipeError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            searchResults = try decoder.decode(MealResponse.self, from: data)
        }
    }
    
    // FOR FAVORITING
    // this retrieves the favorites
    func loadFavorites() {
        if let data = favoritesJSON.data(using: .utf8) {
            let decoder = JSONDecoder()
            if let decodedFavorites = try? decoder.decode([Meal].self, from:data) {
                favorites = decodedFavorites
            }
        }
    }
    
    // this says whether the meal is favorited or not
    func isFavorite(id: String) -> Bool {
        // see if the id exists favorites list
        return favorites.contains { (favorite: Meal) in
            favorite.idMeal == id
        }
    }
    
    // this toggles whether a meal is favorited or not
    func toggleFavorite(id: String, name: String, thumb: String) {
        let favoriteMeal = Meal(idMeal: id, strMeal: name, strMealThumb: thumb)
        
        if let index = favorites.firstIndex(of: favoriteMeal) {
            favorites.remove(at: index)
        } else {
            favorites.append(favoriteMeal)
        }
        print("toggle favorite in search view.")
        saveFavoriteMeals()
        print(favorites)
    }
    
    // this updates the app storage
    func saveFavoriteMeals() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(favorites) {
            favoritesJSON = String(data: encoded, encoding: .utf8) ?? "[]"
        }
    }
}
