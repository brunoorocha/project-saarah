//
//  Coordinator.swift
//  project-saarah
//
//  Created by Thiago Valente on 08/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class Coordinator {

    var window: UIWindow?
    var worker: AccountStore?

    init(with window: UIWindow?) {
        self.window = window
    }

    func callController() {
        let navigationController = UINavigationController()
        if (UserDefaults.hasToken()) {
            // Temp viewController to wait for completion
            let viewController = UIViewController()
            viewController.view.backgroundColor = AppStyleGuide.Colors.background.uiColor
            window?.rootViewController = viewController

            // Validate token in API
            worker = AccountWorker(accountService: ApiAccountStore())
            worker?.session({ (result) in
                switch result {
                case .success:
                    navigationController.show(HomeViewController(), sender: nil)
                case .failure:
                    navigationController.show(LoginViewController(), sender: nil)
                }
                self.window?.rootViewController = navigationController
            })
        } else {
            navigationController.show(LoginViewController(), sender: nil)
            window?.rootViewController = navigationController
        }
    }
}
