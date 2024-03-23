//
//  RecipeListService.swift
//  RecipeListApp
//
//  Created by Van Minh Phi on 23/03/2024.
//

import Foundation
import Combine

protocol RecipeListService {
    func fetchList(endpoint: Endpoint) -> AnyPublisher<[Recipe], Error>
}

class DefaultRecipeListService {
    private var method = "GET"
    var host = ""
    var path = ""
    var headers: [String: String] = [:]
    var body: Data?
    
    private let dataProvider: DataProvider
    
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
}

extension DefaultRecipeListService: RecipeListService {
    func fetchList(endpoint: Endpoint) -> AnyPublisher<[Recipe], Error> {
        return dataProvider.request(
            url: endpoint.url,
            method: endpoint.method,
            headers: endpoint.headers,
            body: endpoint.body
        )
    }
}
