//
//  SettingsPresenter.swift
//  project-saarah
//
//  Created by Bruno Rocha on 05/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SettingsPresentationLogic {
	func presentLogOutSuccessMessage(response: Settings.Logout.Response)
}

class SettingsPresenter: SettingsPresentationLogic {
	weak var viewController: SettingsDisplayLogic?

    func presentLogOutSuccessMessage(response: Settings.Logout.Response) {
        viewController?.displayLogOutSuccessMessage(viewModel: Settings.Logout.ViewModel())
    }
}
