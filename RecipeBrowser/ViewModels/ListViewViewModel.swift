//
//  ListViewViewModel.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import Foundation

class ListViewViewModel : ObservableObject {
    @Published var listOfMeals : MealResponse?
    
    init() {}
    
    // get list of meals for the category from API
    func getMealsByCategory(category : String) async throws {
        // api sequence
        let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=\(category)"
        
        // check valid url
        guard let url = URL(string: endpoint) else {
            throw RecipeError.invalidURL
        }
        
        // get data and response
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw RecipeError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            listOfMeals = try decoder.decode(MealResponse.self, from: data)
        }catch{
            throw RecipeError.invalidData
        }
    }
}
