//
//  ServiceFactory.swift
//  RecipeListApp
//
//  Created by Van Minh Phi on 23/03/2024.
//

import Foundation

class ServiceFactory {
    static let shared = ServiceFactory()
    
    var services = [Any]()
    
    func loadService<T>() -> T {
        guard let service = services.first(where: { $0 is T }) as? T else {
            fatalError("Can't find service")
        }
        return service
    }
    
    init() {
        services = [
            DefaultRecipeListService(dataProvider: DataProvider())
        ]
    }
}
