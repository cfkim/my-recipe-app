//
//  Category.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

import Foundation

// category for picker
enum Category : String, CaseIterable {
    case Beef,
         Chicken,
         Dessert,
         Lamb,
         Miscellaneous,
         Pasta,
         Pork,
         Seafood,
         Side,
         Starter,
         Vegan,
         Vegetarian,
         Breakfast,
         Goat
    
    // display name in the picker
    var displayName: String {
            switch self {
                case .Beef: return "🍖 Beef"
                case .Chicken: return "🍗 Chicken"
                case .Dessert: return "🍰 Dessert"
                case .Lamb: return "🍖 Lamb"
                case .Miscellaneous: return "﹖ Misc"
                case .Pasta: return "🍝 Pasta"
                case .Pork: return "🥓 Pork"
                case .Seafood: return "🦞 Seafood"
                case .Side: return "🥗 Side"
                case .Starter: return "🥟 Starter"
                case .Vegan: return "🍒 Vegan"
                case .Vegetarian: return "🥚 Vegetarian"
                case .Breakfast: return "🍳 Breakfast"
                case .Goat: return "🍖 Goat"
            }
        }
}
