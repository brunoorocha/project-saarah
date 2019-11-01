//
//  ListInventoryPresenter.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ListInventoryPresentationLogic {
	func presentProducts(response: ListInventory.FetchProducts.Response)
	func presentInsertedProduct(response: ListInventory.InsertProduct.Response)
}

class ListInventoryPresenter: ListInventoryPresentationLogic {
	weak var viewController: ListInventoryDisplayLogic?

    // MARK: Fetch products
    func presentProducts(response: ListInventory.FetchProducts.Response) {
        var displayProducts: [ListInventory.FetchProducts.ViewModel.DisplayProduct] = []
        for product in response.products {
            // TODO: Get the quantity from product function
            let displayedProduct = ListInventory.FetchProducts.ViewModel.DisplayProduct(
                name: product.name,
                quantity: "\(product.logs.count)")
            displayProducts.append(displayedProduct)
        }
		let viewModel = ListInventory.FetchProducts.ViewModel(displayProducts: displayProducts)
		viewController?.displayFetchedProducts(viewModel: viewModel)
	}
	
	func presentInsertedProduct(response: ListInventory.InsertProduct.Response) {
 		let viewModel = ListInventory.FetchProducts.ViewModel.DisplayProduct(
 			name: response.product.name,
 			quantity: "\(response.product.logs.count)")
 		let displayedProduct = ListInventory.InsertProduct.ViewModel(displayProduct: viewModel)
 		viewController?.displayInsertedProduct(viewModel: displayedProduct)
 	}
}
