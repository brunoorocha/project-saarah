//
//  ProductItemInteractor.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol ProductItemBusinessLogic {
	func getProduct(request: ProductItem.ReceiveProduct.Request)
    func fetchProductItem(request: ProductItem.FetchProductItem.Request)
}

protocol ProductItemDataStore {
	var product: Product? { get set }
    var productItems: [ProductLog]? { get set }
}

class ProductItemInteractor: ProductItemBusinessLogic, ProductItemDataStore {

    var presenter: ProductItemPresentationLogic?
    var product: Product?
    var productItems: [ProductLog]?

    let productItemWorker = ProductItemWorker(productItemService: ApiProductItemStore())

    // MARK: Get product
    func getProduct(request: ProductItem.ReceiveProduct.Request) {
        if let product = product {
            let response = ProductItem.ReceiveProduct.Response(product: product)
            presenter?.presentProduct(response: response)
        }
    }

    // MARK: Fetch product items
    func fetchProductItem(request: ProductItem.FetchProductItem.Request) {
		guard let product = product else { return }
		
		productItemWorker.fetchProductItems(productId: product.id) { (result) in
			switch result {
			case .success(let productLogs):
				if let productItems = productLogs {
					self.productItems = productLogs
					let response = ProductItem.FetchProductItem.Response(ProductItems: productItems)
					self.presenter?.presentProductItem(response: response)
				}
			case .failure(let error):
				// TODO: add property in response struct
				print(error)
			}
			
        }
    }
}
