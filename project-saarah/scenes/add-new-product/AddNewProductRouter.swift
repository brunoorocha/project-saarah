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
	func routeToListInventory()
	func dismissPresentedViewController()
}

protocol AddNewProductDataPassing {
	var dataStore: AddNewProductDataStore? { get }
	var listInventoryReceptor: ProductReceptor? { get set }
}

protocol ProductReceptor {
   var product: Product? { get set }
}

class AddNewProductRouter: NSObject, AddNewProductRoutingLogic, AddNewProductDataPassing {
	weak var viewController: AddNewProductViewController?
	var dataStore: AddNewProductDataStore?

	var listInventoryReceptor: ProductReceptor?

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
		destinationVC.router?.productItemReceptor = dataStore
		destinationVC.presentationController?.delegate = self

		passDataToAddProductItem(source: dataStore, destination: &destinationDataStore)
		navigateToAddProductItem(source: viewController, destination: destinationVC)
	}

	func routeToListInventory() {
		guard let dataStore = dataStore else { return }
 		guard let viewController = viewController else { return }

 		passDataToListInventory(source: dataStore, destinationReceptor: &listInventoryReceptor)
 		navigateBack(source: viewController)
	}

	func dismissPresentedViewController() {
		guard let viewController = viewController else { return }
		viewController.presentedViewController?.dismiss(animated: true, completion: {
			self.routeToListInventory()
		})
	}

	// MARK: Passing data
    func passDataToChooseMeasurement(source: AddNewProductDataStore, destination: inout SelectProductMeasurementDataStore) {
        destination.selectedMeasure = source.measureReceptor
    }

	func passDataToAddProductItem(source: AddNewProductDataStore, destination: inout AddProductItemDataStore) {
		destination.product = source.product
	}

	func passDataToListInventory(source: AddNewProductDataStore, destinationReceptor: inout ProductReceptor?) {
 		destinationReceptor?.product = source.product
 	}

	// MARK: Navigation
	func navigateToChooseMeasurement(source: AddNewProductViewController, destination: SelectProductMeasurementViewController) {
		source.present(destination, animated: true, completion: nil)
	}

	func navigateToAddProductItem(source: AddNewProductViewController, destination: AddProductItemViewController) {
		source.show(destination, sender: nil)
	}

	func navigateBack(source: AddNewProductViewController) {
 		source.dismiss(animated: true, completion: nil)
 	}
}

extension AddNewProductRouter: UIAdaptivePresentationControllerDelegate {
	func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
		routeToListInventory()
	}
}
