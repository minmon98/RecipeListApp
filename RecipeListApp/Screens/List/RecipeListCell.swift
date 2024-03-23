//
//  RecipeListCell.swift
//  RecipeListApp
//
//  Created by Van Minh Phi on 23/03/2024.
//

import Foundation
import SwiftUI

struct RecipeListCell: View {
    private let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
            HStack(alignment: .center, spacing: 8) {
                AsyncImage(url: URL(string: recipe.thumb ?? "")) {
                    image in
                        image
                    }
                    placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
                VStack(alignment: .leading) {
                    Text(recipe.name ?? "")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    Text(recipe.headline ?? "")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    Text("Calories: \(recipe.calories ?? "")")
                        .font(Font.subheadline)
                        .foregroundColor(.black)
                    Text("Difficulty: \(recipe.difficulty ?? 0)")
                        .font(Font.subheadline)
                        .foregroundColor(.black)
                }
            }
        }
    }
}
