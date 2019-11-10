//
//  SettingsBuilder.swift
//  project-saarah
//
//  Created by Bruno Rocha on 05/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SettingsBuilder {
    static func build(aroundViewController viewController: SettingsViewController) {
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter()
        let router = SettingsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
