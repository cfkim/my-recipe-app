//
//  DetailViewViewModel.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import Foundation
import SwiftUI

class DetailViewViewModel : ObservableObject {
    @Published var favorites : [Meal] = []
    @AppStorage("favorites") var favoritesJSON = "[]"
    @Published var mealDetailsResponse : MealDetailsResponse?
    @Published var meal : MealDetails?
    
    init() {}
    
    func getMealDetails(mealID : String) async throws {
        let endpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
        
        guard let url = URL(string: endpoint) else{
            throw RecipeError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw RecipeError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            mealDetailsResponse = try decoder.decode(MealDetailsResponse.self, from: data)
            meal = mealDetailsResponse?.meals[0]
        }catch{
            throw RecipeError.invalidData
        }
    }
}
