//
//  AppSplitViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 04/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class AppSplitViewController: UISplitViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configurateLeftNavigationController()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurateLeftNavigationController() {
        let restaurantDomainsMenuViewController = RestaurantDomainsMenuViewController()
        let leftNavigationController = UINavigationController(rootViewController: restaurantDomainsMenuViewController)
        let blankViewController = UIViewController()
        blankViewController.view.backgroundColor = .white

        viewControllers = [leftNavigationController, blankViewController]
    }
}
