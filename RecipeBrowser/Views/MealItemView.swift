//
//  MealItemView.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import SwiftUI

struct MealItemView: View {
    let id : String
    let thumbnail : String
    let isFavorite : String
    
    @StateObject var viewModel = MealItemViewViewModel()
    
    var body: some View {
        
    }
}

#Preview {
    MealItemView(id: "52897", thumbnail: "52897", isFavorite: "False")
}
