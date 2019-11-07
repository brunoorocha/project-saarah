//
//  LoginRouter.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol LoginRoutingLogic {
	func routeToSignUp()
}

protocol LoginDataPassing {
	var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
	weak var viewController: LoginViewController?
	var dataStore: LoginDataStore?

	// MARK: Routing
	func routeToSignUp() {
		let destinationVC = CreateAccountViewController()

		guard let viewController = viewController else { return }
		navigateToSignUp(source: viewController, destination: destinationVC)
	}

	// MARK: Passing data

	// MARK: Navigation
	func navigateToSignUp(source: LoginViewController, destination: CreateAccountViewController) {
		source.show(destination, sender: nil)
	}
}
