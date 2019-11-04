//
//  CreateAccountRouter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol CreateAccountRoutingLogic {
	//func routeToSomewhere()
}

protocol CreateAccountDataPassing {
	var dataStore: CreateAccountDataStore? { get }
}

class CreateAccountRouter: NSObject, CreateAccountRoutingLogic, CreateAccountDataPassing {
	weak var viewController: CreateAccountViewController?
	var dataStore: CreateAccountDataStore?

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
//	func passDataToSomewhere(source: CreateAccountDataStore, destination: inout SomewhereDataStore) {
//		destination.name = source.name
//	}
//
//	// MARK: Navigation
//	func navigateToSomewhere(source: CreateAccountViewController, destination: SomewhereViewController) {
//		source.show(destination, sender: nil)
//	}
}
