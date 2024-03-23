//
//  RecipeListAppTests.swift
//  RecipeListAppTests
//
//  Created by Van Minh Phi on 23/03/2024.
//

import XCTest
import Combine
import SwiftUI
@testable import RecipeListApp

final class RecipeListAppTests: XCTestCase {
    private var intent: RecipeListIntent?
    private let service = MockRecipeListService()
    
    override func setUpWithError() throws {
        let state = DefaultRecipeListState()
        intent = DefaultRecipeIntent(model: state, service: service)
    }
    
    func testFetchListSuccess() {
        service.error = nil
        intent?.fetchList()
    }
    
    func testFetchListError() {
        service.error = URLError(.badURL)
        intent?.fetchList()
    }
}

class MockRecipeListService: RecipeListService {
    var list = [Recipe]()
    var error: Error?
    
    func fetchList(endpoint: Endpoint) -> AnyPublisher<[Recipe], Error> {
        if let error = error {
            return Fail(error: error).eraseToAnyPublisher()
        }
        return Just(list)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
