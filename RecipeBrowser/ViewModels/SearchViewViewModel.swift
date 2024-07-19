//
//  SearchViewViewModel.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import Foundation

class SearchViewViewModel : ObservableObject {
    @Published var searchResults : MealResponse?
    
    init() {}
    
    func getSearchResults(searchText: String) async throws {
        let endpoint = "https://themealdb.com/api/json/v1/1/search.php?s=\(searchText)"
        
        guard let url = URL(string: endpoint) else {
            throw RecipeError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw RecipeError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            searchResults = try decoder.decode(MealResponse.self, from: data)
        }
    }
}
