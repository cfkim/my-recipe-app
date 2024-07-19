//
//  IngredientsView.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/19/24.
//

import SwiftUI

struct IngredientsView: View {
    let ingredients : [[String]]
    
    init(ingredients: [[String]]) {
            self.ingredients = ingredients
            print("Ingredients passed to IngredientsView: \(ingredients)")
        }
    
    var body: some View {
        List{
            ForEach(ingredients, id: \.self) { ingredient in
                HStack{
                    Text(ingredient[0])
                    Spacer()
                    Text(ingredient[1])
                }
            }
        }
        .listStyle(.plain)
        .padding()
        .onAppear{
            print("generate view")
        }

    }
}

#Preview {
    IngredientsView(ingredients: [["Eggs", "2"], ["Milk", "1 c"], ["Bacon", "1 tsp"]])
}
