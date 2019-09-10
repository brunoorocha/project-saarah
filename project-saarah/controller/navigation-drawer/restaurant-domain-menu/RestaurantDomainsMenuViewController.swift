//
//  RestaurantDomainsMenuViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 04/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class RestaurantDomainsMenuViewController: NavigationDrawerViewController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        menuOptions = RestaurantDomainMenu.allCases
        title = "Restaurante"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didSelectOptionAt(index: Int) {
        let nextViewController = menuOptions[index].viewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
