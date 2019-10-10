//
//  ProductWorker.swift
//  project-saarah
//
//  Created by Thiago Valente on 08/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol MockProductStore {
    func fetchProducts(_ completion: @escaping ([Product])->())
}

class ProductWorker {
    let productService: MockProductStore
    
    init(productService: MockProductStore) {
        self.productService = productService
    }
    
    func fetchProducts(_ completion: @escaping ([Product])->()) {
        productService.fetchProducts { (products) in
            DispatchQueue.main.async {
                completion(products)
            }
        }
    }
}
