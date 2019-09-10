//
//  InventoryMenuViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 04/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class InventoryMenuViewController: NavigationDrawerViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        menuOptions = InventoryMenu.allCases
        title = "Estoque"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didSelectOptionAt(index: Int) {
        let nextViewController = menuOptions[index].viewController
        let navigationController = UINavigationController(rootViewController: nextViewController)
        splitViewController?.showDetailViewController(navigationController, sender: nil)
    }
}
