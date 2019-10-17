//
//  AddProductItemRouter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddProductItemRoutingLogic {
	//func routeToSomewhere()
}

protocol AddProductItemDataPassing {
	var dataStore: AddProductItemDataStore? { get }
}

class AddProductItemRouter: NSObject, AddProductItemRoutingLogic, AddProductItemDataPassing {
	weak var viewController: AddProductItemViewController?
	var dataStore: AddProductItemDataStore?

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
//	func passDataToSomewhere(source: AddProductItemDataStore, destination: inout SomewhereDataStore) {
//		destination.name = source.name
//	}
//
//	// MARK: Navigation
//	func navigateToSomewhere(source: AddProductItemViewController, destination: SomewhereViewController) {
//		source.show(destination, sender: nil)
//	}
}
