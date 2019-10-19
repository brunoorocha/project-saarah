//
//  ProductItemRouter.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ProductItemRoutingLogic {
	//func routeToSomewhere()
}

protocol ProductItemDataPassing {
	var dataStore: ProductItemDataStore? { get }
}

class ProductItemRouter: NSObject, ProductItemRoutingLogic, ProductItemDataPassing {
	weak var viewController: ProductItemViewController?
	var dataStore: ProductItemDataStore?

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
//	func passDataToSomewhere(source: ProductItemDataStore, destination: inout SomewhereDataStore) {
//		destination.name = source.name
//	}
//
//	// MARK: Navigation
//	func navigateToSomewhere(source: ProductItemViewController, destination: SomewhereViewController) {
//		source.show(destination, sender: nil)
//	}
}
