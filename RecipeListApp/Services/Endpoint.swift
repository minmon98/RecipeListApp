//
//  Endpoint.swift
//  RecipeListApp
//
//  Created by Van Minh Phi on 23/03/2024.
//

import Foundation

enum Endpoint {
    case fetchRecipeList
    
    var url: String {
        switch self {
        case .fetchRecipeList:
            return "https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test/recipes.json"
        }
    }
    
    var method: String {
        switch self {
        case .fetchRecipeList:
            return "GET"
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .fetchRecipeList:
            return [:]
        }
    }
    
    var body: Data? {
        switch self {
        case .fetchRecipeList:
            return nil
        }
    }
}
