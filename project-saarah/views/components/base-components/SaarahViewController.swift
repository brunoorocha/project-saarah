//
//  SaarahViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 29/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultViewControllerConfiguration()
    }

    private func defaultViewControllerConfiguration () {
        view.backgroundColor = AppStyleGuide.Colors.background.uiColor

        let navbarTitleAttributes = [
            NSAttributedString.Key.font: AppStyleGuide.Typography.heading3.uiFont,
            NSAttributedString.Key.foregroundColor: AppStyleGuide.Colors.textColor.uiColor
        ]

        let navbarLargeTitleAttributes = [
            NSAttributedString.Key.font: AppStyleGuide.Typography.heading1.uiFont,
            NSAttributedString.Key.foregroundColor: AppStyleGuide.Colors.textColor.uiColor
        ]

        navigationController?.navigationBar.titleTextAttributes = navbarTitleAttributes
        navigationController?.navigationBar.largeTitleTextAttributes = navbarLargeTitleAttributes
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
