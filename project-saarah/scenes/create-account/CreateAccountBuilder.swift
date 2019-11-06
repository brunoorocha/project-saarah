//
//  CreateAccountBuilder.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class CreateAccountBuilder {
    static func build(aroundViewController viewController: CreateAccountViewController) {
        let interactor = CreateAccountInteractor()
        let presenter = CreateAccountPresenter()
        let router = CreateAccountRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
