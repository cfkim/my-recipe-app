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
    @StateObject var favoritesViewModel = FavoritesViewViewModel()

    
    var body: some View {
        
        NavigationView{
            if !searchText.isEmpty{
                ScrollView{
                    if let meals = viewModel.searchResults?.meals {
                        ForEach(meals, id: \.self) { meal in
                            MealItemView(id: meal.idMeal, name: meal.strMeal, thumbnail: meal.strMealThumb, viewModel: favoritesViewModel)
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
    }
}

#Preview {
    SearchView()
}
