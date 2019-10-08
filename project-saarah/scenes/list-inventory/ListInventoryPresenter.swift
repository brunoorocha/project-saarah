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
                quantity: "\(product.log.count)")
            displayProducts.append(displayedProduct)
        }
		let viewModel = ListInventory.FetchProducts.ViewModel(displayProducts: displayProducts)
		viewController?.displayFetchedProducts(viewModel: viewModel)
	}
}
