//
//  ProductDetailRouter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ProductDetailRoutingLogic {
	//func routeToSomewhere()
}

protocol ProductDetailDataPassing {
	var dataStore: ProductDetailDataStore? { get }
}

class ProductDetailRouter: NSObject, ProductDetailRoutingLogic, ProductDetailDataPassing {
	weak var viewController: ProductDetailViewController?
	var dataStore: ProductDetailDataStore?

	// MARK: Routing
//	func routeToSomewhere() {
//		let destinationVC = SomewhereViewController()
//		guard var destinationDataStore = destinationVC.router?.dataStore else { return }
//
//		guard let dataStore = dataStore else { return }
//		guard let viewController = viewController else { return }
//
//		passDataToSomewhere(source: dataStore, destination: &destinationDataStore)
//		navigateToSomewhere(source: viewController, destination: destinationVC)
//	}
//
//	// MARK: Passing data
//	func passDataToSomewhere(source: ProductDetailDataStore, destination: inout SomewhereDataStore) {
//		destination.name = source.name
//	}
//
//	// MARK: Navigation
//	func navigateToSomewhere(source: ProductDetailViewController, destination: SomewhereViewController) {
//		source.show(destination, sender: nil)
//	}
}
