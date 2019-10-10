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

protocol ListInventoryDataStore {
    var products: [Product]? { get }
}

class ListInventoryInteractor: ListInventoryBusinessLogic, ListInventoryDataStore {

    var presenter: ListInventoryPresentationLogic?
    var products: [Product]?

    let productWorker = ProductWorker(productService: MockProduct())

	// MARK: Fetch Products
    func fetchProducts(request: ListInventory.FetchProducts.Request) {
        productWorker.fetchProducts { (products) in
            self.products = products
            let response = ListInventory.FetchProducts.Response(products: products)
            self.presenter?.presentProducts(response: response)
        }
	}
}
