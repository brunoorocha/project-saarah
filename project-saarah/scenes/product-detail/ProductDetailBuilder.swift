//
//  ProductDetailBuilder.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 08/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class ProductDetailBuilder {
	static func build(aroundViewController viewController: ProductDetailViewController) {
		let interactor = ProductDetailInteractor()
		let presenter = ProductDetailPresenter()
		let router = ProductDetailRouter()
		viewController.interactor = interactor
		viewController.router = router
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
	}
}
