import SwiftUI
import SwiftData

struct IngredientsView: View {
  typealias Selection = (IngredientModel) -> Void

  let selection: Selection?

  init(selection: Selection? = nil) {
    self.selection = selection
  }
    //EDIT
    @Environment(\.modelContext) var context
    @Query var ingredientsArray : [IngredientModel]
    
  @Environment(\.dismiss) private var dismiss
  @State private var query = ""

  // MARK: - Body

  var body: some View {
    NavigationStack {
      content
        .navigationTitle("Ingredients")
        .toolbar {
          if !ingredientsArray.isEmpty { //EDIT
            NavigationLink(value: IngredientForm.Mode.add) {
              Label("Add", systemImage: "plus")
            }
          }
        }
        .navigationDestination(for: IngredientForm.Mode.self) { mode in
          IngredientForm(mode: mode)
        }
    }
  }

  // MARK: - Views

  @ViewBuilder
  private var content: some View {
    if ingredientsArray.isEmpty { // EDIT
      empty
    } else {// EDIT
      list(for: ingredientsArray.filter {
        if query.isEmpty {
          return true
        } else {
          return $0.name.localizedStandardContains(query)
        }
      })
    }
  }

  private var empty: some View {
    ContentUnavailableView(
      label: {
        Label("No Ingredients", systemImage: "list.clipboard")
      },
      description: {
        Text("Ingredients you add will appear here.")
      },
      actions: {
        NavigationLink("Add Ingredient", value: IngredientForm.Mode.add)
          .buttonBorderShape(.roundedRectangle)
          .buttonStyle(.borderedProminent)
      }
    )
  }

  private var noResults: some View {
    ContentUnavailableView(
      label: {
        Text("Couldn't find \"\(query)\"")
      }
    )
    .listRowSeparator(.hidden)
  }

  private func list(for ingredients: [IngredientModel]) -> some View {
    List {
      if ingredients.isEmpty {
        noResults
      } else {
        ForEach(ingredients) { ingredient in
          row(for: ingredient)
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
              Button("Delete", systemImage: "trash", role: .destructive) {
                delete(ingredient: ingredient)
              }
            }
        }
      }
    }
    .searchable(text: $query)
    .listStyle(.plain)
  }

  @ViewBuilder
  private func row(for ingredient: IngredientModel) -> some View {
    if let selection {
      Button(
        action: {
            print("Selected ingredient: \(ingredient.name)")
          selection(ingredient)
          dismiss()
        },
        label: {
          title(for: ingredient)
        }
      )
    } else {
      NavigationLink(value: IngredientForm.Mode.edit(ingredient)) {
        title(for: ingredient)
      }
    }
  }

  private func title(for ingredient: IngredientModel) -> some View {
    Text(ingredient.name)
      .font(.title3)
  }

  // MARK: - Data

  private func delete(ingredient: IngredientModel) {
      context.delete(ingredient)
  }
}
