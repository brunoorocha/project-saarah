//
//  ProductDetailPresenter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ProductDetailPresentationLogic {
	func presentProduct(response: ProductDetail.GetProduct.Response)
}

class ProductDetailPresenter: ProductDetailPresentationLogic {
	weak var viewController: ProductDetailDisplayLogic?

	// MARK: Do something
	func presentProduct(response: ProductDetail.GetProduct.Response) {
		let productViewModel = ProductDetail.GetProduct.ViewModel.ProductViewModel(name: response.product.name, quantity: response.product.quantity())
		var logsViewModels: [ProductDetail.GetProduct.ViewModel.LogViewModel] = []
		
		response.product.logs.forEach { (log) in
			let dateString = DateFormatManager.withSlash(from: log.createdDate)
			var message = "\(response.product.measure.name) de \(response.product.name)"
			var quantityString = response.product.measure.name
			
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
			
			let logViewModel = ProductDetail.GetProduct.ViewModel.LogViewModel(date: dateString, message: message, activityIcon: log.type)
			logsViewModels.append(logViewModel)
		}
		
		let viewModel = ProductDetail.GetProduct.ViewModel(productViewModel: productViewModel, logsViewModels: logsViewModels)
		viewController?.displayProduct(viewModel: viewModel)
	}
}
