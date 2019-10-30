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
		guard let viewController = viewController else { return }

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
	func passDataToAddProductItem(source: AddNewProductDataStore, destination: inout AddProductItemDataStore) {
		destination.product = source.product
	}

	// MARK: Navigation
	func navigateToChooseMeasurement(source: AddNewProductViewController, destination: SelectProductMeasurementViewController) {
        guard let viewController = viewController else { return }
        guard let dataStore = dataStore else { return }
        destination.delegate = viewController
        if let measureName = dataStore.measure?.name {
            let request = SelectProductMeasurement.SelectMeasure.Request(name: measureName)
            destination.interactor?.selectMeasure(request: request)
        }
		source.show(destination, sender: nil)
	}

	func navigateToAddProductItem(source: AddNewProductViewController, destination: AddProductItemViewController) {
		source.show(destination, sender: nil)
	}
}
