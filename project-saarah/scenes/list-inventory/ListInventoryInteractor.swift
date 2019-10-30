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
	func insertProduct(request: ListInventory.InsertProduct.Request)
}

protocol ListInventoryDataStore: NewProductReceptor {
    var products: [Product]? { get }
}

class ListInventoryInteractor: ListInventoryBusinessLogic, ListInventoryDataStore {

    var presenter: ListInventoryPresentationLogic?
    var products: [Product]?
	var product: Product? {
		didSet {
			guard let product = product else { return }
			let request = ListInventory.InsertProduct.Request(product: product)
			self.insertProduct(request: request)
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
	
	func insertProduct(request: ListInventory.InsertProduct.Request) {
		let response = ListInventory.InsertProduct.Response(product: request.product)
		presenter?.presentInsertedProduct(response: response)
	}
}
