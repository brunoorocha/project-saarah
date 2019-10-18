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
            var price = "Não informado"
            var expiration = "Não informado"
            if let hasPrice = item.price { price = "\(hasPrice.roundToDecimal(2))" }
            if let hasExpiration = item.expiration { expiration = "\(hasExpiration.formatter())" }
            let displayedItem = ProductItem.FetchProductItem.ViewModel.DisplayProductItem(
                amount: "\(item.quantity)",
                expiration: expiration,
                price: price,
                created: item.createdDate.formatter())
            displayItems.append(displayedItem)
        }
        let viewModel = ProductItem.FetchProductItem.ViewModel(DisplayProductItems: displayItems)
        viewController?.displayProductItem(viewModel: viewModel)
    }

}
