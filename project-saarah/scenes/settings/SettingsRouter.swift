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
        // TODO: Call login view controller
    }
}
