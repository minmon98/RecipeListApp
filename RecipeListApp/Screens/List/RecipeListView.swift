//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Van Minh Phi on 23/03/2024.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var state: DefaultRecipeListState
    
    private var intent: RecipeListIntent
    
    init(state: DefaultRecipeListState, intent: RecipeListIntent) {
        self.state = state
        self.intent = intent
    }
    
    var body: some View {
        NavigationView {
            switch state.contentState {
            case .initial:
                Text("Init")
                
            case .loading:
                ProgressView()
                
            case .fetched(let list):
                List(list) { recipe in
                    RecipeListCell(recipe: recipe)
                }
                .navigationBarTitle("Recipe List")
                
            case .error(let error):
                Text("Error: \(error.localizedDescription)")
            }
        }
        .onAppear(perform: intent.fetchList)
    }
}

extension RecipeListView {
    static func build() -> some View {
        let state = DefaultRecipeListState()
        let intent: RecipeListIntent = DefaultRecipeIntent(
            model: state,
            service: ServiceFactory.shared.loadService()
        )
        return RecipeListView(state: state , intent: intent)
    }
}

#Preview {
    RecipeListView.build()
}
