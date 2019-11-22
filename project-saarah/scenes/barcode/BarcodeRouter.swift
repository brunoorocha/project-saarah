//
//  BarcodeRouter.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol BarcodeRoutingLogic {
	func routeToProductDetails()
    func routeToNewProduct()
}

protocol BarcodeDataPassing {
	var dataStore: BarcodeDataStore? { get }
}

class BarcodeRouter: NSObject, BarcodeRoutingLogic, BarcodeDataPassing {
	weak var viewController: BarcodeViewController?
	var dataStore: BarcodeDataStore?

	// MARK: Routing
    func routeToProductDetails() {
        let destinationVC = ProductDetailViewController()
        guard var destinationDataStore = destinationVC.router?.dataStore else { return }

        guard let dataStore = dataStore else { return }
        guard let viewController = viewController else { return }

        passDataToProductDetail(source: dataStore, destination: &destinationDataStore)
        navigateToProductDetail(source: viewController, destination: destinationVC)
    }

    func routeToNewProduct() {
        let destinationVC = AddNewProductViewController()
        guard var destinationDataStore = destinationVC.router?.dataStore else { return }

        guard let dataStore = dataStore else { return }
        guard let viewController = viewController else { return }
        destinationVC.modalPresentationStyle = .fullScreen

        passDataToNewProduct(source: dataStore, destination: &destinationDataStore)
        navigateToNewProduct(source: viewController, destination: destinationVC)
    }

	// MARK: Passing data
	func passDataToProductDetail(source: BarcodeDataStore, destination: inout ProductDetailDataStore) {
        destination.product = source.product
	}

    func passDataToNewProduct(source: BarcodeDataStore, destination: inout AddNewProductDataStore) {
//        destination.barCode = source.barcode
    }

	// MARK: Navigation
	func navigateToProductDetail(source: BarcodeViewController, destination: ProductDetailViewController) {
		source.show(destination, sender: nil)
	}

    func navigateToNewProduct(source: BarcodeViewController, destination: AddNewProductViewController) {
         source.present(destination, animated: true, completion: nil)
    }
}
