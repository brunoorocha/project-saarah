//
//  ProductWorker.swift
//  project-saarah
//
//  Created by Thiago Valente on 08/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol ProductStoreProtocol {
    func fetchProducts(_ completion: @escaping ([Product]) -> Void)
    func addProduct(name: String, barcode: String?, measureId: String, _ completion: @escaping (Result<Product?, NetworkServiceError>) -> Void)
}

class ProductWorker {
    let productService: ProductStoreProtocol

    init(productService: ProductStoreProtocol) {
        self.productService = productService
    }

    func fetchProducts(_ completion: @escaping ([Product]) -> Void) {
        productService.fetchProducts { (products) in
            DispatchQueue.main.async {
                completion(products)
            }
        }
    }

    func addProduct(withName name: String, andBarcode barcode: String?, andMeasureId measureId: String, _ completion: @escaping (Result<Product?, NetworkServiceError>) -> Void) {
        productService.addProduct(name: name, barcode: barcode, measureId: measureId) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
