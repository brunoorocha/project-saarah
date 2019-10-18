//
//  ProductItemBuilder.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductItemBuilder {
    static func build(aroundViewController viewController: ProductItemViewController) {
        let interactor = ProductItemInteractor()
        let presenter = ProductItemPresenter()
        let router = ProductItemRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

