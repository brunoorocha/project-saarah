//
//  AddProductItemRouter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddProductItemRoutingLogic {
	func routeBack()
}

protocol AddProductItemDataPassing {
	var dataStore: AddProductItemDataStore? { get }
	var productItemReceptor: ProductItemReceptor? { get set }
}

protocol ProductItemReceptor: class {
	var productItem: ProductLog? { get set }
}

class AddProductItemRouter: NSObject, AddProductItemRoutingLogic, AddProductItemDataPassing {
	weak var viewController: AddProductItemViewController?
	var dataStore: AddProductItemDataStore?

	var productItemReceptor: ProductItemReceptor?

	// MARK: Routing
	func routeBack() {
		guard let dataStore = dataStore else { return }
		passDataToProductItem(source: dataStore, destinationReceptor: productItemReceptor)
	}

	// MARK: Passing data
	func passDataToProductItem(source: AddProductItemDataStore, destinationReceptor: ProductItemReceptor?) {
		destinationReceptor?.productItem = source.productItem
	}

	// MARK: Navigation
}
