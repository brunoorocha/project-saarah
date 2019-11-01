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

protocol ProductItemReceptor: class {
	var productItem: ProductLog? { get set }
}

class AddProductItemRouter: NSObject, AddProductItemRoutingLogic, AddProductItemDataPassing {
	weak var viewController: AddProductItemViewController?
	var dataStore: AddProductItemDataStore?
	
	weak var productItemReceptor: ProductItemReceptor?

	// MARK: Routing
	func routeToProductItem() {
		guard let dataStore = dataStore else { return }
		guard let viewController = viewController else { return }

		passDataToProductItem(source: dataStore, destinationReceptor: productItemReceptor)
		navigateBackProductItem(source: viewController)
	}

//	// MARK: Passing data
	func passDataToProductItem(source: AddProductItemDataStore, destinationReceptor: ProductItemReceptor?) {
		destinationReceptor?.productItem = source.productItem
	}

	// MARK: Navigation
	func navigateBackProductItem(source: AddProductItemViewController) {
		source.dismiss(animated: true, completion: nil)
	}
}
