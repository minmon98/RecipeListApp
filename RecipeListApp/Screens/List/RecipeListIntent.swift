//
//  RecipeListIntent.swift
//  RecipeListApp
//
//  Created by Van Minh Phi on 23/03/2024.
//

import Foundation
import Combine

protocol RecipeListIntent {
    func fetchList()
}

class DefaultRecipeIntent {
    private var model: RecipeListState
    private let service: RecipeListService
    private var cancellables = Set<AnyCancellable>()
    
    init(model: RecipeListState, service: RecipeListService) {
        self.model = model
        self.service = service
    }
}

extension DefaultRecipeIntent: RecipeListIntent {
    func fetchList() {
        model.contentState = .loading
        service.fetchList(endpoint: .fetchRecipeList)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.model.contentState = .error(error)
                    
                case .finished:
                    break
                }
            } receiveValue: { [weak self] list in
                self?.model.contentState = .fetched(list)
            }
            .store(in: &cancellables)
    }
}
