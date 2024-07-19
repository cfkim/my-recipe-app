//
//  MealBasicInfo.swift
//  RecipeBrowser
//
//  Created by Christine Kim on 7/18/24.
//

// used for querying only necessary information from meals
import Foundation

struct MealDetails : Codable, Hashable {
    let strMeal : String
    let strMealThumb : String
    
    // instructions
    let strInstructions: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
    
    // measurements
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
    let strMeasure11: String
    let strMeasure12: String
    let strMeasure13: String
    let strMeasure14: String
    let strMeasure15: String
    let strMeasure16: String
    let strMeasure17: String
    let strMeasure18: String
    let strMeasure19: String
    let strMeasure20: String
    
    // adds bullet points to the instructions
    var bulletedString : String {
        let text = strInstructions.components(separatedBy: "\r\n")
        let bulletedString = text.map { "• \($0) \n" }
        return bulletedString.joined(separator: "\n")
    }

    // makes ingredients a string
    var ingredients: [[String]] {
        let allIngredients: [[String?]] = [
            [strIngredient1, strMeasure1],
            [strIngredient2,strMeasure2],
            [strIngredient3,strMeasure3],
            [strIngredient4,strMeasure4],
            [strIngredient5,strMeasure5],
            [strIngredient6,strMeasure6],
            [strIngredient7,strMeasure7],
            [strIngredient8,strMeasure8],
            [strIngredient9,strMeasure9],
            [strIngredient10,strMeasure10],
            [strIngredient11,strMeasure11],
            [strIngredient12,strMeasure12],
            [strIngredient13,strMeasure13],
            [strIngredient14,strMeasure14],
            [strIngredient15,strMeasure15],
            [strIngredient16, strMeasure16],
            [strIngredient17,strMeasure17],
            [strIngredient18,strMeasure18],
            [strIngredient19,strMeasure19],
            [strIngredient20,strMeasure20],
            
        ]
        
        // Filters out nil and empty strings
        let nonEmptyIngredients = allIngredients.compactMap { ingredientPair -> [String]? in
            guard let ingredient = ingredientPair[0], !ingredient.isEmpty,
                  let measure = ingredientPair[1], !measure.isEmpty else {
                return nil
            }
            return [ingredient, measure]
        }
        
        return nonEmptyIngredients
    }

}
