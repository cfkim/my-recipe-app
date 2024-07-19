//
//  ListView.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import SwiftUI

struct ListView: View {
    @State var selection : Category = .Dessert
    @StateObject var viewModel = ListViewViewModel()
    @State var favorites : [Meal] = []
    @AppStorage("favorites") private var favoritesJSON = "[]"
    
    var body: some View {
        NavigationView{
            VStack{
                Picker("Category", selection: $selection) {
                    ForEach(Category.allCases, id: \.self) { category in
                        Text(category.displayName)
                    }
                }
                .onChange(of: selection) {
                    Task{
                        do {
                            try await viewModel.getMealsByCategory(category: selection.rawValue)
                        }catch RecipeError.invalidURL{
                            print("invalid URL")
                        }catch RecipeError.invalidResponse{
                            print("invalid response")
                        }catch RecipeError.invalidData{
                            print("invalid data")
                        }catch{
                            print("unexpected error")
                        }
                    }
                }
                ScrollView{
                    VStack{
                        if let meals = viewModel.listOfMeals?.meals{
                            ForEach(meals, id: \.self) { meal in
                                NavigationLink(destination: DetailView(mealID: meal.idMeal, mealName: meal.strMeal, mealThumb: meal.strMealThumb)) {
                                    MealItemView(id: meal.idMeal, name: meal.strMeal, thumbnail: meal.strMealThumb)
                                        .overlay(alignment: .topTrailing){
                                            Button(action: {
                                                toggleFavorite(id: meal.idMeal, name: meal.strMeal, thumb: meal.strMealThumb)
                                            }) {
                                                Image(systemName: isFavorite(id: meal.idMeal) ? "heart.fill" : "heart")
                                            }
                                        }
                                }
                            }
                        }else{
                            Text("loading...")
                                .offset(y: 250)
                                .foregroundColor(.blue)
                        }
                        
                    }
                }
            }
            .onAppear{
                Task{
                    do {
                        try await viewModel.getMealsByCategory(category: "Dessert")
                    }catch RecipeError.invalidURL{
                        print("invalid URL")
                    }catch RecipeError.invalidResponse{
                        print("invalid response")
                    }catch RecipeError.invalidData{
                        print("invalid data")
                    }catch{
                        print("unexpected error")
                    }
                }
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
    ListView()
}
