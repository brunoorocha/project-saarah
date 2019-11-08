//
//  ListInventoryInteractor.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ListInventoryBusinessLogic {
    func fetchProducts(request: ListInventory.FetchProducts.Request)
}

protocol ListInventoryDataStore: ProductReceptor {
    var products: [Product]? { get }
}

class ListInventoryInteractor: ListInventoryBusinessLogic, ListInventoryDataStore {

    var presenter: ListInventoryPresentationLogic?
    var products: [Product]?
	var product: Product? {
		didSet {
			if (products == nil) {
				self.products = [Product]()
			}
			guard let product = product else { return }
			products?.append(product)

			let response = ListInventory.InsertProduct.Response(product: product)
			self.presenter?.presentInsertedProduct(response: response)
		}
	}

    let productWorker = ProductWorker(productService: ApiProductStore())

	// MARK: Fetch Products
    func fetchProducts(request: ListInventory.FetchProducts.Request) {
        productWorker.fetchProducts { (products) in
            self.products = products
            let response = ListInventory.FetchProducts.Response(products: products)
            self.presenter?.presentProducts(response: response)
        }
	}
}
