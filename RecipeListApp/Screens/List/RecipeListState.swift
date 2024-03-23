//
//  RecipeListState.swift
//  RecipeListApp
//
//  Created by Van Minh Phi on 23/03/2024.
//

import Foundation

protocol RecipeListState {
    var contentState: ContentState { get set }
}

enum ContentState {
    case initial
    case loading
    case fetched(_ list: [Recipe])
    case error(_ error: Error)
}

class DefaultRecipeListState: ObservableObject, RecipeListState {
    @Published var contentState: ContentState = .initial
}
