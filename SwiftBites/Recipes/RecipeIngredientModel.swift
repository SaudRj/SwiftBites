//
//  RecipeIngredinetModel.swift
//  SwiftBites
//
//  Created by Abo Rajhi on 14/01/1446 AH.
//

import Foundation
import SwiftData

@Model
final class RecipeIngredientModel: Identifiable{
    let id: UUID
    var ingredient: IngredientModel
    var quantity: String

    init(id: UUID = UUID(), ingredient: IngredientModel = IngredientModel(), quantity: String = "") {
      self.id = id
      self.ingredient = ingredient
      self.quantity = quantity
        print("RecipeIngredientModel initialized with ingredient: \(ingredient.name), quantity: \(quantity)")
    }
}
