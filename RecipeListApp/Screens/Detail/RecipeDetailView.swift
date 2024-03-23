//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Van Minh Phi on 23/03/2024.
//

import Foundation
import SwiftUI

struct RecipeDetailView: View {
    private let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text(recipe.name ?? "")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                Text(recipe.headline ?? "")
                    .font(.subheadline)
                    .foregroundColor(.black)
                Text("Calories: \(recipe.calories ?? "")")
                    .font(Font.subheadline)
                    .foregroundColor(.black)
                Text("Proteins: \(recipe.proteins ?? "")")
                    .font(Font.subheadline)
                    .foregroundColor(.black)
                Text("Difficulty: \(recipe.difficulty ?? 0)")
                    .font(Font.subheadline)
                    .foregroundColor(.black)
                Text("Fats: \(recipe.fats ?? "")")
                    .font(Font.subheadline)
                    .foregroundColor(.black)
                Spacer(minLength: 16)
                Text(recipe.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer(minLength: 16)
                AsyncImage(url: URL(string: recipe.image ?? "")) {
                    image in
                        image
                    }
                    placeholder: {
                        ProgressView()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                    .cornerRadius(8)
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
        }
        .navigationBarTitle(recipe.name ?? "")
    }
}
