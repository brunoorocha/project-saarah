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
	func routeToAddNewProduct()
    func routeToBarcode()
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

        let destinationVC = ProductDetailViewController()
        guard var destinationDataStore = destinationVC.router?.dataStore else {
            return
        }

        guard let dataStore = dataStore else { return }

		passDataToDetail(source: dataStore, destination: &destinationDataStore)
		navigateToDetail(source: viewController, destination: destinationVC)
	}

	func routeToAddNewProduct() {
 		let destinationVC = AddNewProductViewController()

 		guard let viewController = viewController else { return }
 		guard let dataStore = dataStore else { return }
		destinationVC.router?.listInventoryReceptor = dataStore

 		navigateToAddNewProduct(source: viewController, destination: destinationVC)
 	}

    func routeToProductDetails(from barcodeVC: BarcodeViewController, destination: ProductDetailViewController) {
        viewController?.navigationController?.popViewController(animated: true)
        viewController?.show(destination, sender: nil)
    }

    func routeToBarcode() {
        let destinationVC = BarcodeViewController()
        guard let viewController = viewController else { return }

        navigateToReaderBarcode(source: viewController, destination: destinationVC)
    }

	// MARK: Passing data
	func passDataToDetail(source: ListInventoryDataStore, destination: inout ProductDetailDataStore) {
        guard let viewController = viewController else { return }

        guard let index = viewController.selectedRow else { return }
        guard let products = source.products else { return }
		destination.product = products[index]
	}

	// MARK: Navigation
	func navigateToDetail(source: ListInventoryViewController, destination: ProductDetailViewController) {
		source.show(destination, sender: nil)
	}

	func navigateToAddNewProduct(source: ListInventoryViewController, destination: AddNewProductViewController) {
 		source.present(destination, animated: true, completion: nil)
 	}

    func navigateToReaderBarcode(source: ListInventoryViewController, destination: BarcodeViewController) {
        source.show(destination, sender: nil)
    }
}
