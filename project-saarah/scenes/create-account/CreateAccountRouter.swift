//
//  CreateAccountRouter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol CreateAccountRoutingLogic {
	func routeToHome()
}

protocol CreateAccountDataPassing {
	var dataStore: CreateAccountDataStore? { get }
}

class CreateAccountRouter: NSObject, CreateAccountRoutingLogic, CreateAccountDataPassing {
	weak var viewController: CreateAccountViewController?
	var dataStore: CreateAccountDataStore?

	// MARK: Routing
	func routeToHome() {
		let destinationVC = HomeViewController()
		guard let viewController = viewController else { return }
		navigateToHome(source: viewController, destination: destinationVC)
	}

	// MARK: Passing data

	// MARK: Navigation
	func navigateToHome(source: CreateAccountViewController, destination: HomeViewController) {
		guard let navigationController = source.navigationController else { return }
		navigationController.popToRootViewController(animated: true)
		navigationController.show(destination, sender: nil)
		navigationController.viewControllers.removeAll(where: { !($0 is HomeViewController) })
	}
}
