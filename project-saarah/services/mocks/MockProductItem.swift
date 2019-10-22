//
//  MockProductItems.swift
//  project-saarah
//
//  Created by Thiago Valente on 18/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class MockProductItem: ProductItemStore {
    func fetchProductItems(_ completion: @escaping ([ProductLog]) -> Void) {
        let productItem1 = ProductLog(id: 1, type: .input, price: 6.87, quantity: 10, createdDate: Date(), expiration: nil)
        let productItem2 = ProductLog(id: 2, type: .output, price: 8.50, quantity: 13, createdDate: Date(), expiration: nil)
        let productItem3 = ProductLog(id: 3, type: .input, price: 6.47, quantity: 15, createdDate: Date(), expiration: Date())
        DispatchQueue.main.async {
            completion([productItem1, productItem2, productItem3])
        }
    }

	func addProductItem(_ completion: @escaping (Response) -> Void) {
		let response = Response(code: "100", message: "success")
		DispatchQueue.main.async {
			completion(response)
		}
	}
}
