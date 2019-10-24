//
//  AddProductItemBuilder.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class AddProductItemBuilder {
    static func build(aroundViewController viewController: AddProductItemViewController) {
        let interactor = AddProductItemInteractor()
        let presenter = AddProductItemPresenter()
        let router = AddProductItemRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
		
		let product = Product(id: "5dab0dd88971bd0017eb80cd", name: "foda-se", measure: Measure(id: "foda-se", name: "foda-se"), barCode: "foda-se", logs: [])
		interactor.product = product
    }
}
