//
//  ProductDetailPresenter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol ProductDetailPresentationLogic {
	func presentProduct(response: ProductDetail.GetProduct.Response)
}

class ProductDetailPresenter: ProductDetailPresentationLogic {
	weak var viewController: ProductDetailDisplayLogic?

	// MARK: Do something
	func presentProduct(response: ProductDetail.GetProduct.Response) {
		let productQuantity = response.product.quantity() + " " + response.product.measure.name
		let productViewModel = ProductDetail.GetProduct.ViewModel.ProductViewModel(name: response.product.name, quantity: productQuantity)
		var logsViewModels: [ProductDetail.GetProduct.ViewModel.LogViewModel] = []

		response.product.logs.forEach { (log) in
			let dateString = DateFormat.withSlash(from: log.createdDate)
			var message = "\(response.product.measure.name) de \(response.product.name)"
			var quantityString = ""

			if (log.quantity.rounded(.down) == log.quantity) {
				quantityString = "\(Int(log.quantity)) " + quantityString
			} else {
				quantityString = String(format: "%d.2 ", log.quantity) + quantityString
			}

			if (log.type == .input) {
				message = "Adicionados " + quantityString + message
			} else {
				message = "Usados " + quantityString + message
			}

            guard let activityIcon = ActivityIcon(rawValue: log.type.rawValue) else { return }
            let logViewModel = ProductDetail.GetProduct.ViewModel.LogViewModel(date: dateString, message: message, activityIcon: activityIcon)
			logsViewModels.append(logViewModel)
		}

		let viewModel = ProductDetail.GetProduct.ViewModel(productViewModel: productViewModel, logsViewModels: logsViewModels)
		viewController?.displayProduct(viewModel: viewModel)
	}
}
