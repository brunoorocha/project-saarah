//
//  AddNewProductRouter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddNewProductRoutingLogic {
	func routeToChooseMeasurement()
	func routeToAddProductItem()
}

protocol AddNewProductDataPassing {
	var dataStore: AddNewProductDataStore? { get }
}

class AddNewProductRouter: NSObject, AddNewProductRoutingLogic, AddNewProductDataPassing {
	weak var viewController: AddNewProductViewController?
	var dataStore: AddNewProductDataStore?

	// MARK: Routing
	func routeToChooseMeasurement() {
		let destinationVC = SelectProductMeasurementViewController()
        guard var destinationDataStore = destinationVC.router?.dataStore else { return }
        destinationVC.router?.selectMeasureDataStore = dataStore

        guard let dataStore = dataStore else { return }
		guard let viewController = viewController else { return }

        passDataToChooseMeasurement(source: dataStore, destination: &destinationDataStore)
		navigateToChooseMeasurement(source: viewController, destination: destinationVC)
	}

	func routeToAddProductItem() {
		let destinationVC = AddProductItemViewController()
		guard var destinationDataStore = destinationVC.router?.dataStore else { return }

		guard let dataStore = dataStore else { return }
		guard let viewController = viewController else { return }

		passDataToAddProductItem(source: dataStore, destination: &destinationDataStore)
		navigateToAddProductItem(source: viewController, destination: destinationVC)
	}

	// MARK: Passing data
    func passDataToChooseMeasurement(source: AddNewProductDataStore, destination: inout SelectProductMeasurementDataStore) {
        destination.selectedMeasure = source.measureReceptor
    }

	func passDataToAddProductItem(source: AddNewProductDataStore, destination: inout AddProductItemDataStore) {
		destination.product = source.product
	}

	// MARK: Navigation
	func navigateToChooseMeasurement(source: AddNewProductViewController, destination: SelectProductMeasurementViewController) {
		source.show(destination, sender: nil)
	}

	func navigateToAddProductItem(source: AddNewProductViewController, destination: AddProductItemViewController) {
		source.show(destination, sender: nil)
	}
}
