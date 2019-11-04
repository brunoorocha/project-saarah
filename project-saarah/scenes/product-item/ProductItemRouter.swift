//
//  ProductItemRouter.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ProductItemRoutingLogic {
	func routeToAddProductItem()
	func dismissPresentedViewController(_ completion: @escaping () -> ())
}

protocol ProductItemDataPassing {
	var dataStore: ProductItemDataStore? { get }
}

class ProductItemRouter: NSObject, ProductItemRoutingLogic, ProductItemDataPassing {
	weak var viewController: ProductItemViewController?
	var dataStore: ProductItemDataStore?

	// MARK: Routing
	func routeToAddProductItem() {
		let destinationVC = AddProductItemViewController()
		guard var destinationDataStore = destinationVC.router?.dataStore else { return }

		guard let dataStore = dataStore else { return }
		guard let viewController = viewController else { return }
		destinationVC.router?.productItemReceptor = dataStore

		passDataToAddProductItem(source: dataStore, destination: &destinationDataStore)
		navigateToAddProductItem(source: viewController, destination: destinationVC)
	}

	func dismissPresentedViewController(_ completion: @escaping () -> ()) {
		guard let viewController = viewController else { return }
		viewController.presentedViewController?.dismiss(animated: true, completion: {
			completion()
		})
	}
	
	// MARK: Passing data
	func passDataToAddProductItem(source: ProductItemDataStore, destination: inout AddProductItemDataStore) {
		destination.product = source.product
	}

	// MARK: Navigation
	func navigateToAddProductItem(source: ProductItemViewController, destination: AddProductItemViewController) {
		source.present(destination, animated: true, completion: nil)
	}
}
