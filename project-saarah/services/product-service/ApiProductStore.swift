//
//  ApiProductStore.swift
//  project-saarah
//
//  Created by Bruno Rocha on 19/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class ApiProductStore: ProductStoreProtocol {
    func fetchProducts(_ completion: @escaping ([Product]) -> Void) {
        let networkService = NetworkService()
        networkService.request(endpoint: ConeheadApiEndpoint.fetchProducts) { (result: Result<[Product]?, NetworkServiceError>) in
            switch result {
            case .success(let products):
                guard let products = products else {
                    completion([])
                    return
                }

                completion(products)
            case .failure(let error):
                print(error)
            }
        }
    }
}
