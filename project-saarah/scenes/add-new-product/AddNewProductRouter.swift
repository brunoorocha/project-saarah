//
//  AddNewProductRouter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddNewProductRoutingLogic {
	//func routeToSomewhere()
}

protocol AddNewProductDataPassing {
	var dataStore: AddNewProductDataStore? { get }
}

class AddNewProductRouter: NSObject, AddNewProductRoutingLogic, AddNewProductDataPassing {
	weak var viewController: AddNewProductViewController?
	var dataStore: AddNewProductDataStore?

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
//	func passDataToSomewhere(source: AddNewProductDataStore, destination: inout SomewhereDataStore) {
//		destination.name = source.name
//	}
//
//	// MARK: Navigation
//	func navigateToSomewhere(source: AddNewProductViewController, destination: SomewhereViewController) {
//		source.show(destination, sender: nil)
//	}
}
