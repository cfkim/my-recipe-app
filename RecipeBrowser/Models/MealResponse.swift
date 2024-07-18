//
//  MealResponse.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

// used for result of querying for specific meal.
import Foundation

struct MealResponse : Codable, Hashable {
    let meals : [Meal]
}
