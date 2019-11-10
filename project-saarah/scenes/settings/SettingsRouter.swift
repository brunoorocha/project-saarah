//
//  SettingsRouter.swift
//  project-saarah
//
//  Created by Bruno Rocha on 05/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SettingsRoutingLogic {
	func routeToLoginScene()
}

protocol SettingsDataPassing {
	var dataStore: SettingsDataStore? { get }
}

class SettingsRouter: NSObject, SettingsRoutingLogic, SettingsDataPassing {
	weak var viewController: SettingsViewController?
	var dataStore: SettingsDataStore?

    func routeToLoginScene() {
        guard let viewController = viewController else { return }
        let destination = LoginViewController()
        navigateToHome(source: viewController, destination: destination)
    }

    private func navigateToHome(source: SettingsViewController, destination: LoginViewController) {
        let navigationController = UINavigationController(rootViewController: destination)
        if let window = UIApplication.shared.windows.first {
             window.rootViewController = navigationController
        }
    }
}
