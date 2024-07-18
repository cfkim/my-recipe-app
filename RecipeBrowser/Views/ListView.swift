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

    var body: some View {

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
            
            NavigationView{
                ScrollView{
                    VStack{
                        if let meals = viewModel.listOfMeals?.meals{
                            ForEach(meals, id: \.self) { meal in
                                Text(meal.strMeal)
                            }
                        }
                        
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
        }
    }
}

#Preview {
    ListView()
}
