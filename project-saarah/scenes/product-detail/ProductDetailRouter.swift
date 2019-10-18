//
//  ProductDetailRouter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol ProductDetailRoutingLogic {
	func routeToProductItems()
}

protocol ProductDetailDataPassing {
	var dataStore: ProductDetailDataStore? { get }
}

class ProductDetailRouter: NSObject, ProductDetailRoutingLogic, ProductDetailDataPassing {
	weak var viewController: ProductDetailViewController?
	var dataStore: ProductDetailDataStore?

	// TODO: - Remove coments to push to next controller
	// MARK: Routing
	func routeToProductItems() {
//		let destinationVC = ProductItemsViewController()
//		guard var destinationDataStore = destinationVC.router?.dataStore else { return }
//
//		guard let dataStore = dataStore else { return }
//		guard let viewController = viewController else { return }
//
//		passDataToSomewhere(source: dataStore, destination: &destinationDataStore)
//		navigateToSomewhere(source: viewController, destination: destinationVC)
	}

	// MARK: Passing data
//	func passDataToSomewhere(source: ProductDetailDataStore, destination: inout ProductItemsDataStore) {
//		destination.product = source.product
//	}
//
//	// MARK: Navigation
//	func navigateToSomewhere(source: ProductDetailViewController, destination: ProductItemsViewController) {
//		source.show(destination, sender: nil)
//	}
}
