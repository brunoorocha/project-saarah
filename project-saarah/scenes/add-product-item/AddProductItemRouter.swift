//
//  AddProductItemRouter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddProductItemRoutingLogic {
	func routeToProductItem()
}

protocol AddProductItemDataPassing {
	var dataStore: AddProductItemDataStore? { get }
}

class AddProductItemRouter: NSObject, AddProductItemRoutingLogic, AddProductItemDataPassing {
	weak var viewController: AddProductItemViewController?
	var dataStore: AddProductItemDataStore?

	// MARK: Routing
	func routeToProductItem() {
		guard let dataStore = dataStore else { return }
		guard let viewController = viewController else { return }

		passDataToProductItem(source: dataStore, destinationDelegate: viewController.delegate)
		navigateBackProductItem(source: viewController)
	}
	
//	// MARK: Passing data
	func passDataToProductItem(source: AddProductItemDataStore, destinationDelegate: AddProductItemViewControllerDelegate?) {
		guard let productItem = source.productItem else { return }
		destinationDelegate?.pass(productItem: productItem)
	}

	// MARK: Navigation
	func navigateBackProductItem(source: AddProductItemViewController) {
		source.dismiss(animated: true, completion: nil)
	}
}
