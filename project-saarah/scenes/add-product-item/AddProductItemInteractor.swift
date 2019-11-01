//
//  AddProductItemInteractor.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AddProductItemBusinessLogic {
	func addProductItem(request: AddProductItem.AddItem.Request)
}

protocol AddProductItemDataStore {
	var product: Product? { get set }
	var productItem: ProductLog? { get set }
}

class AddProductItemInteractor: AddProductItemBusinessLogic, AddProductItemDataStore {
	var presenter: AddProductItemPresentationLogic?

	var product: Product?
	var productItem: ProductLog?

	let productItemWorker = ProductItemWorker(productItemService: ApiProductItemStore())

	// MARK: Do something
	func addProductItem(request: AddProductItem.AddItem.Request) {
		guard let product = product else { return }
		productItemWorker.addProductItem(productId: product.id, price: request.addItemForm.price, quantity: request.addItemForm.quantity, expirationDate: request.addItemForm.expirationDate) { (result) in
			switch result {
			case .success(let productLog):
				self.productItem = productLog
				self.presenter?.presentResponse(response: AddProductItem.AddItem.Response(productLog: productLog))
			case .failure(let error):
				// TODO: add property in response struct
				print(error)
			}
		}
	}
}
