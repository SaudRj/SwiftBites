import Foundation
import SwiftUI

/**
 * This file acts as a mock database for temporary data storage, providing CRUD functionality.
 * It is essential to remove this file before the final project submission.
 */

@Observable
final class Storage {
  enum Error: LocalizedError {
    case ingredientExists
    case categoryExists
    case recipeExists

    var errorDescription: String? {
      switch self {
      case .ingredientExists:
        return "Ingredient with the same name exists"
      case .categoryExists:
        return "Category with the same name exists"
      case .recipeExists:
        return "Recipe with the same name exists"
      }
    }
  }

  init() {}

  private(set) var ingredients: [IngredientModel] = []
  private(set) var categories: [CategoryModel] = []
  private(set) var recipes: [RecipeModel] = []

  // MARK: - Load

  func load() {
    let pizzaDough = IngredientModel(name: "Pizza Dough")
    let tomatoSauce = IngredientModel(name: "Tomato Sauce")
    let mozzarellaCheese = IngredientModel(name: "Mozzarella Cheese")
    let freshBasilLeaves = IngredientModel(name: "Fresh Basil Leaves")
    let extraVirginOliveOil = IngredientModel(name: "Extra Virgin Olive Oil")
    let salt = IngredientModel(name: "Salt")
    let chickpeas = IngredientModel(name: "Chickpeas")
    let tahini = IngredientModel(name: "Tahini")
    let lemonJuice = IngredientModel(name: "Lemon Juice")
    let garlic = IngredientModel(name: "Garlic")
    let cumin = IngredientModel(name: "Cumin")
    let water = IngredientModel(name: "Water")
    let paprika = IngredientModel(name: "Paprika")
    let parsley = IngredientModel(name: "Parsley")
    let spaghetti = IngredientModel(name: "Spaghetti")
    let eggs = IngredientModel(name: "Eggs")
    let parmesanCheese = IngredientModel(name: "Parmesan Cheese")
    let pancetta = IngredientModel(name: "Pancetta")
    let blackPepper = IngredientModel(name: "Black Pepper")
    let driedChickpeas = IngredientModel(name: "Dried Chickpeas")
    let onions = IngredientModel(name: "Onions")
    let cilantro = IngredientModel(name: "Cilantro")
    let coriander = IngredientModel(name: "Coriander")
    let bakingPowder = IngredientModel(name: "Baking Powder")
    let chickenThighs = IngredientModel(name: "Chicken Thighs")
    let yogurt = IngredientModel(name: "Yogurt")
    let cardamom = IngredientModel(name: "Cardamom")
    let cinnamon = IngredientModel(name: "Cinnamon")
    let turmeric = IngredientModel(name: "Turmeric")

    ingredients = [
      pizzaDough,
      tomatoSauce,
      mozzarellaCheese,
      freshBasilLeaves,
      extraVirginOliveOil,
      salt,
      chickpeas,
      tahini,
      lemonJuice,
      garlic,
      cumin,
      water,
      paprika,
      parsley,
      spaghetti,
      eggs,
      parmesanCheese,
      pancetta,
      blackPepper,
      driedChickpeas,
      onions,
      cilantro,
      coriander,
      bakingPowder,
      chickenThighs,
      yogurt,
      cardamom,
      cinnamon,
      turmeric,
    ]

    var italian = CategoryModel(name: "Italian")
    var middleEastern = CategoryModel(name: "Middle Eastern")

    let margherita = RecipeModel(
      name: "Classic Margherita Pizza",
      summary: "A simple yet delicious pizza with tomato, mozzarella, basil, and olive oil.",
      category: italian,
      serving: 4,
      time: 50,
      ingredients: [
        RecipeIngredientModel(ingredient: pizzaDough, quantity: "1 ball"),
        RecipeIngredientModel(ingredient: tomatoSauce, quantity: "1/2 cup"),
        RecipeIngredientModel(ingredient: mozzarellaCheese, quantity: "1 cup, shredded"),
        RecipeIngredientModel(ingredient: freshBasilLeaves, quantity: "A handful"),
        RecipeIngredientModel(ingredient: extraVirginOliveOil, quantity: "2 tablespoons"),
        RecipeIngredientModel(ingredient: salt, quantity: "Pinch"),
      ],
      instructions: "Preheat oven, roll out dough, apply sauce, add cheese and basil, bake for 20 minutes.",
      imageData: UIImage(named: "margherita")?.pngData()
    )

    let spaghettiCarbonara = RecipeModel(
      name: "Spaghetti Carbonara",
      summary: "A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.",
      category: italian,
      serving: 4,
      time: 30,
      ingredients: [
        RecipeIngredientModel(ingredient: spaghetti, quantity: "400g"),
        RecipeIngredientModel(ingredient: eggs, quantity: "4"),
        RecipeIngredientModel(ingredient: parmesanCheese, quantity: "1 cup, grated"),
        RecipeIngredientModel(ingredient: pancetta, quantity: "200g, diced"),
        RecipeIngredientModel(ingredient: blackPepper, quantity: "To taste"),
      ],
      instructions: "Cook spaghetti. Fry pancetta until crisp. Whisk eggs and Parmesan, add to pasta with pancetta, and season with black pepper.",
      imageData: UIImage(named: "spaghettiCarbonara")?.pngData()
    )

    let hummus = RecipeModel(
      name: "Classic Hummus",
      summary: "A creamy and flavorful Middle Eastern dip made from chickpeas, tahini, and spices.",
      category: middleEastern,
      serving: 6,
      time: 10,
      ingredients: [
        RecipeIngredientModel(ingredient: chickpeas, quantity: "1 can (15 oz)"),
        RecipeIngredientModel(ingredient: tahini, quantity: "1/4 cup"),
        RecipeIngredientModel(ingredient: lemonJuice, quantity: "3 tablespoons"),
        RecipeIngredientModel(ingredient: garlic, quantity: "1 clove, minced"),
        RecipeIngredientModel(ingredient: extraVirginOliveOil, quantity: "2 tablespoons"),
        RecipeIngredientModel(ingredient: cumin, quantity: "1/2 teaspoon"),
        RecipeIngredientModel(ingredient: salt, quantity: "To taste"),
        RecipeIngredientModel(ingredient: water, quantity: "2-3 tablespoons"),
        RecipeIngredientModel(ingredient: paprika, quantity: "For garnish"),
        RecipeIngredientModel(ingredient: parsley, quantity: "For garnish"),
      ],
      instructions: "Blend chickpeas, tahini, lemon juice, garlic, and spices. Adjust consistency with water. Garnish with olive oil, paprika, and parsley.",
      imageData: UIImage(named: "hummus")?.pngData()
    )

    let falafel = RecipeModel(
      name: "Classic Falafel",
      summary: "A traditional Middle Eastern dish of spiced, fried chickpea balls, often served in pita bread.",
      category: middleEastern,
      serving: 4,
      time: 60,
      ingredients: [
        RecipeIngredientModel(ingredient: driedChickpeas, quantity: "1 cup"),
        RecipeIngredientModel(ingredient: onions, quantity: "1 medium, chopped"),
        RecipeIngredientModel(ingredient: garlic, quantity: "3 cloves, minced"),
        RecipeIngredientModel(ingredient: cilantro, quantity: "1/2 cup, chopped"),
        RecipeIngredientModel(ingredient: parsley, quantity: "1/2 cup, chopped"),
        RecipeIngredientModel(ingredient: cumin, quantity: "1 tsp"),
        RecipeIngredientModel(ingredient: coriander, quantity: "1 tsp"),
        RecipeIngredientModel(ingredient: salt, quantity: "1 tsp"),
        RecipeIngredientModel(ingredient: bakingPowder, quantity: "1/2 tsp"),
      ],
      instructions: "Soak chickpeas overnight. Blend with onions, garlic, herbs, and spices. Form into balls, add baking powder, and fry until golden.",
      imageData: UIImage(named: "falafel")?.pngData()
    )

    let shawarma = RecipeModel(
      name: "Chicken Shawarma",
      summary: "A popular Middle Eastern dish featuring marinated chicken, slow-roasted to perfection.",
      category: middleEastern,
      serving: 4,
      time: 120,
      ingredients: [
        RecipeIngredientModel(ingredient: chickenThighs, quantity: "1 kg, boneless"),
        RecipeIngredientModel(ingredient: yogurt, quantity: "1 cup"),
        RecipeIngredientModel(ingredient: garlic, quantity: "3 cloves, minced"),
        RecipeIngredientModel(ingredient: lemonJuice, quantity: "3 tablespoons"),
        RecipeIngredientModel(ingredient: cumin, quantity: "1 tsp"),
        RecipeIngredientModel(ingredient: coriander, quantity: "1 tsp"),
        RecipeIngredientModel(ingredient: cardamom, quantity: "1/2 tsp"),
        RecipeIngredientModel(ingredient: cinnamon, quantity: "1/2 tsp"),
        RecipeIngredientModel(ingredient: turmeric, quantity: "1/2 tsp"),
        RecipeIngredientModel(ingredient: salt, quantity: "To taste"),
        RecipeIngredientModel(ingredient: blackPepper, quantity: "To taste"),
        RecipeIngredientModel(ingredient: extraVirginOliveOil, quantity: "2 tablespoons"),
      ],
      instructions: "Marinate chicken with yogurt, spices, garlic, lemon juice, and olive oil. Roast until cooked. Serve with pita and sauces.",
      imageData: UIImage(named: "chickenShawarma")?.pngData()
    )
    
    italian.recipes = [
      margherita,
      spaghettiCarbonara,
    ]
    middleEastern.recipes = [
      hummus,
      falafel,
      shawarma,
    ]

    categories = [
      italian,
      middleEastern,
    ]

    recipes = [
      margherita,
      spaghettiCarbonara,
      hummus,
      falafel,
      shawarma,
    ]
  }

  // MARK: - Categories

  func addCategory(name: String) throws {
    guard categories.contains(where: { $0.name == name }) == false else {
      throw Error.categoryExists
    }
    categories.append(CategoryModel(name: name))
  }

  func deleteCategory(id: CategoryModel.ID) {
    categories.removeAll(where: { $0.id == id })
    for (index, recipe) in recipes.enumerated() where recipe.category?.id == id {
      recipes[index].category = nil
    }
  }

  func updateCategory(id: CategoryModel.ID, name: String) throws {
    guard categories.contains(where: { $0.name == name && $0.id != id }) == false else {
      throw Error.categoryExists
    }
    guard let index = categories.firstIndex(where: { $0.id == id }) else {
      return
    }
    categories[index].name = name
    for (index, recipe) in recipes.enumerated() where recipe.category?.id == id {
      recipes[index].category?.name = name
    }
  }

  // MARK: - Ingredients

  func addIngredient(name: String) throws {
    guard ingredients.contains(where: { $0.name == name }) == false else {
      throw Error.ingredientExists
    }
    ingredients.append(IngredientModel(name: name))
  }

  func deleteIngredient(id: IngredientModel.ID) {
    ingredients.removeAll(where: { $0.id == id })
  }

  func updateIngredient(id: IngredientModel.ID, name: String) throws {
    guard ingredients.contains(where: { $0.name == name && $0.id != id }) == false else {
      throw Error.ingredientExists
    }
    guard let index = ingredients.firstIndex(where: { $0.id == id }) else {
      return
    }
    ingredients[index].name = name
  }

  // MARK: - Recipes

  func addRecipe(
    name: String,
    summary: String,
    category: CategoryModel?,
    serving: Int,
    time: Int,
    ingredients: [RecipeIngredientModel],
    instructions: String,
    imageData: Data?
  ) throws {
    guard recipes.contains(where: { $0.name == name }) == false else {
      throw Error.recipeExists
    }
    let recipe = RecipeModel(
      name: name,
      summary: summary,
      category: category,
      serving: serving,
      time: time,
      ingredients: ingredients,
      instructions: instructions,
      imageData: imageData
    )
    recipes.append(recipe)
    if let category, let index = categories.firstIndex(where: { $0.id == category.id }) {
      categories[index].recipes.append(recipe)
    }
  }

  func deleteRecipe(id: RecipeModel.ID) {
    recipes.removeAll(where: { $0.id == id })
    for cIndex in categories.indices {
      categories[cIndex].recipes.removeAll(where: { $0.id == id })
    }
  }

  func updateRecipe(
    id: RecipeModel.ID,
    name: String,
    summary: String,
    category: CategoryModel?,
    serving: Int,
    time: Int,
    ingredients: [RecipeIngredientModel],
    instructions: String,
    imageData: Data?
  ) throws {
    guard recipes.contains(where: { $0.name == name && $0.id != id }) == false else {
      throw Error.recipeExists
    }
    guard let index = recipes.firstIndex(where: { $0.id == id }) else {
      return
    }
    let recipe = RecipeModel(
      id: id,
      name: name,
      summary: summary,
      category: category,
      serving: serving,
      time: time,
      ingredients: ingredients,
      instructions: instructions,
      imageData: imageData
    )
    recipes[index] = recipe
    for cIndex in categories.indices {
      categories[cIndex].recipes.removeAll(where: { $0.id == id })
    }
    if let cIndex = categories.firstIndex(where: { $0.id == category?.id }) {
      categories[cIndex].recipes.append(recipe)
    }
  }
}

struct StorageKey: EnvironmentKey {
  static let defaultValue = Storage()
}

extension EnvironmentValues {
  var storage: Storage {
    get { self[StorageKey.self] }
    set { self[StorageKey.self] = newValue }
  }
}
