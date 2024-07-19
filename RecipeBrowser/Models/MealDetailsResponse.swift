//
//  MealResponseBasic.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

// object for an array of meal objects with just 'basic' info.
import Foundation

struct MealDetailsResponse : Codable, Hashable {
    let meals : [MealDetails]
}
