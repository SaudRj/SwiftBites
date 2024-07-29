import SwiftUI
import SwiftData

@main
struct SwiftBitesApp: App {
    
    var modelContainer: ModelContainer

        init() {
            do {
                let schema = Schema([
                    IngredientModel.self,
                    CategoryModel.self,
                    RecipeModel.self,
                    RecipeIngredientModel.self
                ])
                self.modelContainer = try ModelContainer(for: schema)
            } catch {
                fatalError("Failed to create ModelContainer: \(error)")
            }
        }
  var body: some Scene {
    WindowGroup {
      ContentView()
         .modelContainer(modelContainer)
    }
  }
}
