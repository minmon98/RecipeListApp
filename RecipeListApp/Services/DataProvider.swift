//
//  BaseService.swift
//  RecipeListApp
//
//  Created by Van Minh Phi on 23/03/2024.
//

import Foundation
import UIKit
import Combine

class DataProvider {
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        return URLSession(configuration: configuration)
    }()
    
    func request<T: Decodable>(url: String, method: String, headers: [String: String], body: Data?) -> AnyPublisher<T, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.httpBody = body
        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        return session.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
