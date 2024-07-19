//
//  SearchView.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewViewModel()
    @State var favorites : [Meal] = []
    @AppStorage("favorites") private var favoritesJSON = "[]"
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                if !searchText.isEmpty{
                    if let meals = viewModel.searchResults?.meals {
                        ForEach(meals, id: \.self) { meal in
                            NavigationLink(destination: DetailView(mealID: meal.idMeal, mealName: meal.strMeal, mealThumb: meal.strMealThumb)) {
                                MealItemView(id: meal.idMeal, name: meal.strMeal, thumbnail: meal.strMealThumb)
                                    .overlay(alignment: .topTrailing){
                                        Image(systemName: isFavorite(id: meal.idMeal) ? "heart.fill" : "")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                            .offset(x: -40, y: 40)
                                    }
                            }
                        }
                    }
                }else{
                    VStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        Text("results")
                            .foregroundColor(.gray)
                    }
                    .offset(y: 150)
                }
            }
            .searchable(text: $searchText, prompt: "Search meal by name")
            .onChange(of: searchText) {
                Task{
                    do{
                        try await viewModel.getSearchResults(searchText: searchText)
                    }catch RecipeError.invalidURL{
                        print("invalid URL")
                    }catch RecipeError.invalidData{
                        print("invalid data")
                    }catch RecipeError.invalidResponse{
                        print("invalid response")
                    }catch{
                        print("unexpected error")
                    }
                }
            }
            .onAppear{
                loadFavorites()
            }
        }
        
    }
    
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

#Preview {
    SearchView()
}
