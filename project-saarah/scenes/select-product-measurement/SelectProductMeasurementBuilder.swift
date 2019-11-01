//
//  SelectProductMeasurementBuilder.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SelectProductMeasurementBuilder {
    static func build(aroundViewController viewController: SelectProductMeasurementViewController) {
        let interactor = SelectProductMeasurementInteractor()
        let presenter = SelectProductMeasurementPresenter()
        let router = SelectProductMeasurementRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
