//
//  SelectProductMeasurementRouter.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SelectProductMeasurementRoutingLogic {
	//func routeToSomewhere()
}

protocol SelectProductMeasurementDataPassing {
	var dataStore: SelectProductMeasurementDataStore? { get }
}

class SelectProductMeasurementRouter: NSObject, SelectProductMeasurementRoutingLogic, SelectProductMeasurementDataPassing {
	weak var viewController: SelectProductMeasurementViewController?
	var dataStore: SelectProductMeasurementDataStore?

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
//	func passDataToSomewhere(source: SelectProductMeasurementDataStore, destination: inout SomewhereDataStore) {
//		destination.name = source.name
//	}
//
//	// MARK: Navigation
//	func navigateToSomewhere(source: SelectProductMeasurementViewController, destination: SomewhereViewController) {
//		source.show(destination, sender: nil)
//	}
}
