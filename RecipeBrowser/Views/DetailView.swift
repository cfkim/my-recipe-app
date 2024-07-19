//
//  DetailView.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import SwiftUI

enum Views : String, CaseIterable {
    case ingredients, directions
}
struct DetailView: View {
    let mealID : String
    let mealName: String
    let mealThumb: String
    @StateObject var viewModel = DetailViewViewModel()
    @State var selectedView : Views = .ingredients
    
    var body: some View {
        
        VStack{
            Text(mealName)
                .font(.title)
            AsyncImage(url: URL(string: mealThumb)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
            } placeholder: {
                Image(systemName: "fork.knife")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.secondary)
            }
            .padding()
            Picker("Views", selection: $selectedView) {
                    ForEach(Views.allCases, id: \.self) { view in
                        Text(view.rawValue.capitalized)
                    }
            }
            .pickerStyle(.segmented)
            
            if(selectedView == .ingredients){
                List{
                    ForEach(viewModel.meal?.ingredients ?? [["none", "none"]], id: \.self) { ingredient in
                        HStack{
                            Text(ingredient[0])
                            Spacer()
                            Text(ingredient[1])
                        }
                    }
                }
                .listStyle(.plain)
                
            }else{
                DirectionsView(directions: viewModel.meal?.bulletedString ?? "none")
            }
            
            /*
             if(selectedView == .ingredients){
                 IngredientsView(ingredients: viewModel.meal?.ingredients ?? [["", ""]])
             }else{
                 DirectionsView()
             }
             */
            
        }
        .padding()
        .onAppear{
            Task{
                do{
                    try await viewModel.getMealDetails(mealID: mealID)
                }catch RecipeError.invalidURL{
                    print("invalid URL")
                }catch RecipeError.invalidResponse{
                    print("invalid response")
                }catch RecipeError.invalidData{
                    print("invalid data")
                }
            }
        } 
    }
}

#Preview {
    DetailView(mealID: "52893", mealName: "carrot", mealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg")
}
