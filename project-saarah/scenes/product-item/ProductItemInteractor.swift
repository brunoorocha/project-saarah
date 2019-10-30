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
	func insertProductItem(request: ProductItem.InsertProductItem.Request)
}

protocol ProductItemDataStore: ProductItemReceptor {
	var product: Product? { get set }
    var productItems: [ProductLog]? { get set }
}

class ProductItemInteractor: ProductItemBusinessLogic, ProductItemDataStore {

    var presenter: ProductItemPresentationLogic?
    var product: Product?
    var productItems: [ProductLog]?
	var productItem: ProductLog? {
		didSet {
			guard let insertedProductItem = productItem else { return }
			self.productItems?.append(insertedProductItem)
            let request = ProductItem.InsertProductItem.Request(productItem: insertedProductItem)
			self.insertProductItem(request: request)
		}
	}

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

	// MARK: Insert product item
	func insertProductItem(request: ProductItem.InsertProductItem.Request) {
		guard var productItems = productItems else { return }
		productItems.append(request.productItem)

		let response = ProductItem.InsertProductItem.Response(productItem: request.productItem)
		presenter?.presentInsertedProductItem(response: response)
	}
}
