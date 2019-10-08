//
//  HomeBuilder.swift
//  project-saarah
//
//  Created by Bruno Rocha on 08/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class HomeBuilder {
    static func build(aroundViewController viewController: HomeViewController) {
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
