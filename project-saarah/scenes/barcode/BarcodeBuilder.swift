//
//  BarcodeBuilder.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class BarcodeBuilder {
    static func build(aroundViewController viewController: BarcodeViewController) {
        let interactor = BarcodeInteractor()
        let presenter = BarcodePresenter()
        let router = BarcodeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
