//
//  AddNewProductBuilder.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class AddNewProductBuilder {
    static func build(aroundViewController viewController: AddNewProductViewController) {
        let interactor = AddNewProductInteractor()
        let presenter = AddNewProductPresenter()
        let router = AddNewProductRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
