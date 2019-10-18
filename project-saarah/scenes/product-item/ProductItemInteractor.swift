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
    var productItems: [ProductLog] { get set }
}

class ProductItemInteractor: ProductItemBusinessLogic, ProductItemDataStore {

    var presenter: ProductItemPresentationLogic?
    var product: Product?
    var productItems: [ProductLog] = []

    // MARK: Get product
    func getProduct(request: ProductItem.ReceiveProduct.Request) {
        if let product = product {
            let response = ProductItem.ReceiveProduct.Response(product: product)
            presenter?.presentProduct(response: response)
        }
    }

    // MARK: Fetch product items
    func fetchProductItem(request: ProductItem.FetchProductItem.Request) {
        let response = ProductItem.FetchProductItem.Response(ProductItems: [])
        presenter?.presentProductItem(response: response)
    }
}
