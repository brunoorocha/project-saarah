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
        let viewController = UIViewController()
        let leftNavigationController = UINavigationController(rootViewController: viewController)
        let blankViewController = UIViewController()
        blankViewController.view.backgroundColor = .white

        viewControllers = [leftNavigationController, blankViewController]
    }
}
