//
//  ApiAddProductItemStore.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 22/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class ApiAddProductItemStore: ProductItemStore {
	func fetchProductItems(_ completion: @escaping ([ProductLog]) -> Void) {
		
	}
	
	func addProductItem(productId: String, price: Double, quantity: Double, expirationDate: String, _ completion: @escaping (Result<ProductLog?, NetworkServiceError>) -> Void) {
		let networkService = NetworkService()
		networkService.request(endpoint: ConeheadApiEndpoint.addProductItem(productId: productId, price: price, quantity: quantity, expirationDate: expirationDate)) { (result: Result<ProductLog?, NetworkServiceError>) in
			completion(result)
		}
	}
}
