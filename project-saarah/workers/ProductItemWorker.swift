//
//  ProductItemWorker.swift
//  project-saarah
//
//  Created by Thiago Valente on 18/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol ProductItemStore {
    func fetchProductItems(_ completion: @escaping ([ProductLog]) -> Void)
	func addProductItem(_ completion: @escaping (Response) -> Void)
}

class ProductItemWorker: ProductItemStore {
    let productItemService: ProductItemStore

    init(productItemService: ProductItemStore) {
        self.productItemService = productItemService
    }

    func fetchProductItems(_ completion: @escaping ([ProductLog]) -> Void) {
        productItemService.fetchProductItems { (productItems) in
            DispatchQueue.main.async {
                completion(productItems)
            }
        }
    }

	func addProductItem(_ completion: @escaping (Response) -> Void) {
		productItemService.addProductItem { (response) in
			DispatchQueue.main.async {
				completion(response)
			}
		}
	}
}
