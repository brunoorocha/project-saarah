//
//  SettingsPresenter.swift
//  project-saarah
//
//  Created by Bruno Rocha on 05/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SettingsPresentationLogic {
	func presentSomething(response: Settings.Something.Response)
}

class SettingsPresenter: SettingsPresentationLogic {
	weak var viewController: SettingsDisplayLogic?

	// MARK: Do something
	func presentSomething(response: Settings.Something.Response) {
	}
}
