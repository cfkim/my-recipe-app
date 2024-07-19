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

    var body: some View {
        
        NavigationView{
            if !searchText.isEmpty{
                ScrollView{
                    if let meals = viewModel.searchResults?.meals {
                        ForEach(meals, id: \.self) { meal in
                            NavigationLink(destination: DetailView(mealID: meal.idMeal, mealName: meal.strMeal, mealThumb: meal.strMealThumb)) {
                                MealItemView(id: meal.idMeal, name: meal.strMeal, thumbnail: meal.strMealThumb)
                                    .overlay(alignment: .topTrailing){
                                        Image(systemName: viewModel.isFavorite(id: meal.idMeal) ? "heart.fill" : "heart")
                                            .onTapGesture {
                                                viewModel.toggleFavorite(id: meal.idMeal, name: meal.strMeal, thumb: meal.strMealThumb)
                                            }
                                    }
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
