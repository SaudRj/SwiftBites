//
//  IngredientModel.swift
//  SwiftBites
//
//  Created by Abo Rajhi on 14/01/1446 AH.
//

import Foundation
import SwiftData

@Model
final class IngredientModel: Identifiable {
    let id: UUID
    @Attribute(.unique) var name: String

    init(id: UUID = UUID(), name: String = "") {
      self.id = id
      self.name = name
        print("IngredientModel initialized with name: \(name)")

    }
}
