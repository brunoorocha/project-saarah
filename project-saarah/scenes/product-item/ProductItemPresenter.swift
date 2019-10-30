//
//  ProductItemPresenter.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol ProductItemPresentationLogic {
    func presentProduct(response: ProductItem.ReceiveProduct.Response)
    func presentProductItem(response: ProductItem.FetchProductItem.Response)
	func presentInsertedProductItem(response: ProductItem.InsertProductItem.Response)
}

class ProductItemPresenter: ProductItemPresentationLogic {
	weak var viewController: ProductItemDisplayLogic?

	// MARK: Present the product
	func presentProduct(response: ProductItem.ReceiveProduct.Response) {
        let product = ProductItem.ReceiveProduct.ViewModel.Product(name: response.product.name)
        let viewModel = ProductItem.ReceiveProduct.ViewModel(product: product)
		viewController?.displayProduct(viewModel: viewModel)
	}

    // MARK: Present the product items
    func presentProductItem(response: ProductItem.FetchProductItem.Response) {
        var displayItems: [ProductItem.FetchProductItem.ViewModel.DisplayProductItem] = []
        for item in response.ProductItems {
            var price = "\(Localization(.productItemScene(.notInformed)))"
            var expiration = "\(Localization(.productItemScene(.notInformed)))"
            if let hasPrice = item.price { price = "\(hasPrice.roundToDecimal(2))" }
            if let hasExpiration = item.expiration { expiration = "\(hasExpiration.formatter())" }
            let displayedItem = ProductItem.FetchProductItem.ViewModel.DisplayProductItem(
                amount: "\(item.quantity)",
                expiration: expiration,
                price: price,
                created: item.createdDate.formatter())
            displayItems.append(displayedItem)
        }
        let viewModel = ProductItem.FetchProductItem.ViewModel(displayProductItems: displayItems)
        viewController?.displayProductItem(viewModel: viewModel)
    }

	// MARK: Present the product item inserted
	func presentInsertedProductItem(response: ProductItem.InsertProductItem.Response) {
		var price = "\(Localization(.productItemScene(.notInformed)))"
		var expiration = "\(Localization(.productItemScene(.notInformed)))"
		if let hasPrice = response.productItem.price { price = "\(hasPrice.roundToDecimal(2))" }
		if let hasExpiration = response.productItem.expiration { expiration = "\(hasExpiration.formatter())" }
		let displayedItem = ProductItem.FetchProductItem.ViewModel.DisplayProductItem(
			amount: "\(response.productItem.quantity)",
			expiration: expiration,
			price: price,
			created: response.productItem.createdDate.formatter())
		
		viewController?.displayInsertedProductItem(viewModel: ProductItem.InsertProductItem.ViewModel(displayProductItem: displayedItem))
	}
}
