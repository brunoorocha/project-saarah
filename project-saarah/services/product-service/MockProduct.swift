//
//  MockProduct.swift
//  project-saarah
//
//  Created by Thiago Valente on 08/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class MockProduct: ProductStoreProtocol {
    func addProduct(name: String, barcode: String?, measureId: String, _ completion: @escaping (Result<Product?, NetworkServiceError>) -> Void) {
        //
    }
    
    func fetchProducts(_ completion: @escaping ([Product]) -> Void) {
        let measure = Measure(id: "1", name: "Quilo", abbreviation: "kg")
        let productLog1 = ProductLog(id: "1", type: .input, price: 20.0, quantity: 2.0, createdDate: Date(), expiration: Date())
        let produc1 = Product(id: "1", name: "Mussarela", measure: measure, barCode: nil, logs: [productLog1, productLog1])
        let produc2 = Product(id: "1", name: "Presunto", measure: measure, barCode: nil, logs: [productLog1, productLog1])
        let produc3 = Product(id: "1", name: "Leite", measure: measure, barCode: nil, logs: [productLog1, productLog1])

        DispatchQueue.main.async {
            completion([produc1, produc2, produc3])
        }
    }
}
