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

protocol BarcodeReceptor: class {
    var barcodeReceptor: String? { get set }
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

        passDataToNewProduct(source: dataStore, destination: &destinationDataStore)
        navigateToNewProduct(source: viewController, destination: destinationVC)
    }

	// MARK: Passing data
	func passDataToProductDetail(source: BarcodeDataStore, destination: inout ProductDetailDataStore) {
        destination.product = source.product
	}

    func passDataToNewProduct(source: BarcodeDataStore, destination: inout AddNewProductDataStore) {
        destination.barcodeReceptor = source.barcode
    }

	// MARK: Navigation
	func navigateToProductDetail(source: BarcodeViewController, destination: ProductDetailViewController) {
        let parentViewController = source.navigationController?.viewControllers.first(where: { (viewController) -> Bool in
            return viewController is ListInventoryViewController
        })
        guard let listInventoryViewController = parentViewController as? ListInventoryViewController else { return }
        guard let listInventoryRouter = listInventoryViewController.router as? ListInventoryRouter else { return }
        listInventoryRouter.routeToProductDetails(from: source, destination: destination)
	}

    func navigateToNewProduct(source: BarcodeViewController, destination: AddNewProductViewController) {
        destination.modalPresentationStyle = .fullScreen
        source.present(destination, animated: true, completion: nil)
    }
}
