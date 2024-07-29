//
//  ReceipeModel.swift
//  SwiftBites
//
//  Created by Abo Rajhi on 14/01/1446 AH.
//

import Foundation
import SwiftData

@Model
final class RecipeModel: Identifiable{
    let id: UUID
    @Attribute(.unique) var name: String
    var summary: String
    
    var category: CategoryModel?
    
    var serving: Int
    var time: Int
    
    @Relationship(deleteRule: .cascade) var ingredients: [RecipeIngredientModel]
    
    var instructions: String
    var imageData: Data?

    init(
      id: UUID = UUID(),
      name: String = "",
      summary: String = "",
      category: CategoryModel? = nil,
      serving: Int = 1,
      time: Int = 5,
      ingredients: [RecipeIngredientModel] = [],
      instructions: String = "",
      imageData: Data? = nil
    ) {
      self.id = id
      self.name = name
      self.summary = summary
      self.category = category
      self.serving = serving
      self.time = time
      self.ingredients = ingredients
      self.instructions = instructions
      self.imageData = imageData
        print("RecipeModel initialized with id: \(id), name: \(name), ingredients count: \(ingredients.count)")
    }
}
