//
//  ListInventoryRouter.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ListInventoryRoutingLogic {
	func routeToDetail()
}

protocol ListInventoryDataPassing {
	var dataStore: ListInventoryDataStore? { get }
}

class ListInventoryRouter: NSObject, ListInventoryRoutingLogic, ListInventoryDataPassing {
	weak var viewController: ListInventoryViewController?
	var dataStore: ListInventoryDataStore?

	// MARK: Routing
    func routeToDetail() {
        guard let viewController = viewController else { return }
        guard let index = viewController.selectedRow else { return }
        guard let products = dataStore!.products else { return }
        print(products[index].name)
//        guard let viewController = viewController else { return }

//        let destinationVC = ProductDetailViewController()
//        guard var destinationDataStore = destinationVC.router?.dataStore else {
//            return
//        }
//
//        guard let dataStore = dataStore else { return }
//
//		passDataToDetail(source: dataStore, destination: &destinationDataStore)
//		navigateToDetail(source: viewController, destination: destinationVC)
	}

	// MARK: Passing data
//	func passDataToDetail(source: ListInventoryDataStore, destination: inout ProductDetailDataStore) {
//        guard let viewController = viewController else { return }
//
//        guard let index = viewController.selectedRow else { return }
//        guard let products = source.products else { return }
//		destination.product = products[index]
//	}

//	// MARK: Navigation
//	func navigateToDetail(source: ListInventoryViewController, destination: ProductDetailViewController) {
//		source.show(destination, sender: nil)
//	}

}
