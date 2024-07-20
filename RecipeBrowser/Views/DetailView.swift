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
    @State var favorites : [Meal] = []
    @AppStorage("favorites") private var favoritesJSON = "[]"
    var body: some View {
        
        VStack{
            HStack{
                Text(mealName)
                    .font(.title)
                Spacer()
                Button(action: {
                    toggleFavorite(id: mealID, name: mealName, thumb: mealThumb)
                }) {
                    Image(systemName: isFavorite(id: mealID) ? "heart.fill" : "heart")
                        .foregroundColor(.pink)
                }
                
            }
            
            AsyncImage(url: URL(string: mealThumb)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    
            } placeholder: {
                Image(systemName: "fork.knife")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.secondary)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
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
                        if ingredient[0] == "none" && ingredient[1] == "none"{
                            HStack{
                                Text("Cannot find ingredients")
                                    .foregroundColor(.gray)
                                Image(systemName: "questionmark.circle")
                                    .foregroundColor(.gray)
                            }
                            
                            
                        }else{
                            HStack{
                                Text(ingredient[0])
                                Spacer()
                                Text(ingredient[1])
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
            }else{
                DirectionsView(directions: viewModel.meal?.cleanDirections ?? "none")
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
    DetailView(mealID: "52893", mealName: "carrot", mealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg")
}
