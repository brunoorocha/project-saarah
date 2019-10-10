//
//  ListInventory+Extension.swift
//  project-saarah
//
//  Created by Thiago Valente on 07/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ListInventoryBuilder {
    static func build(aroundViewController viewController: ListInventoryViewController) {
        let interactor = ListInventoryInteractor()
        let presenter = ListInventoryPresenter()
        let router = ListInventoryRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
