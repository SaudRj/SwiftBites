//
//  CategoryModel.swift
//  SwiftBites
//
//  Created by Abo Rajhi on 14/01/1446 AH.
//

import Foundation
import SwiftData

@Model
final class CategoryModel: Identifiable{
    let id: UUID
    @Attribute(.unique) var name: String
    @Relationship(deleteRule: .nullify, inverse: \RecipeModel.category) var recipes: [RecipeModel]

    init(id: UUID = UUID(), name: String = "", recipes: [RecipeModel] = []) {
      self.id = id
      self.name = name
      self.recipes = recipes
    }
}
