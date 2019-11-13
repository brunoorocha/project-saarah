//
//  BarcodeRouter.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol BarcodeRoutingLogic {
	//func routeToSomewhere()
}

protocol BarcodeDataPassing {
	var dataStore: BarcodeDataStore? { get }
}

class BarcodeRouter: NSObject, BarcodeRoutingLogic, BarcodeDataPassing {
	weak var viewController: BarcodeViewController?
	var dataStore: BarcodeDataStore?

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
//	func passDataToSomewhere(source: BarcodeDataStore, destination: inout SomewhereDataStore) {
//		destination.name = source.name
//	}
//
//	// MARK: Navigation
//	func navigateToSomewhere(source: BarcodeViewController, destination: SomewhereViewController) {
//		source.show(destination, sender: nil)
//	}
}
