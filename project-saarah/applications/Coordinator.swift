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
    var worker: AccountWorker?

    init(with window: UIWindow?) {
        self.window = window
    }

    func callController() {
        let navigationController = UINavigationController()
        if (UserDefaults.hasToken()) {
            // Temp viewController to wait for completion
            let viewController = UIViewController()
            viewController.view.backgroundColor = AppStyleGuide.Colors.background.uiColor
            viewController.showFullScreenActivityIndicator()
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
            let loginViewController = LoginViewController()
            navigationController.show(loginViewController, sender: nil)
            window?.rootViewController = navigationController

            if (UserDefaults.willShowOnboarding()) {
                presentOnboarding(in: loginViewController)
            }
        }
    }

    func presentOnboarding(in viewController: UIViewController) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        viewController.present(OnboardingCollectionViewController(collectionViewLayout: layout), animated: false)
        UserDefaults.showOnboarding()
    }
}
