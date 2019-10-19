//
//  ProductDetailRouter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol ProductDetailRoutingLogic {
	func routeToProductItem()
}

protocol ProductDetailDataPassing {
	var dataStore: ProductDetailDataStore? { get }
}

class ProductDetailRouter: NSObject, ProductDetailRoutingLogic, ProductDetailDataPassing {
	weak var viewController: ProductDetailViewController?
	var dataStore: ProductDetailDataStore?

	// MARK: Routing
	func routeToProductItem() {
		let destinationVC = ProductItemViewController()
		guard var destinationDataStore = destinationVC.router?.dataStore else { return }

		guard let dataStore = dataStore else { return }
		guard let viewController = viewController else { return }

		passDataToProductItem(source: dataStore, destination: &destinationDataStore)
		navigateToProductItem(source: viewController, destination: destinationVC)
	}

	// MARK: Passing data
	func passDataToProductItem(source: ProductDetailDataStore, destination: inout ProductItemDataStore) {
        guard let product = source.product else { return }
        destination.product = product
	}

	// MARK: Navigation
	func navigateToProductItem(source: ProductDetailViewController, destination: ProductItemViewController) {
		source.show(destination, sender: nil)
	}
}
