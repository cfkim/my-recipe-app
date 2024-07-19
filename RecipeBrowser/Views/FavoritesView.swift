//
//  FavoritesView.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import SwiftUI

struct FavoritesView: View {
    // this view model contains the logic for getting favorite food items. Could refactor this.
    @StateObject var viewModel = FavoritesViewViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                if !viewModel.favorites.isEmpty{
                    ForEach(viewModel.favorites, id: \.self) { meal in
                        MealItemView(id: meal.idMeal, name: meal.strMeal, thumbnail: meal.strMealThumb, viewModel: viewModel)
                    }
                }else{
                    Text("No favorites.")
                        .offset(y: 250)
                        .foregroundColor(.gray)
                }
                
            }
        }
        .onAppear{
            viewModel.loadFavorites()
        }
    }
}

#Preview {
    FavoritesView()
}
