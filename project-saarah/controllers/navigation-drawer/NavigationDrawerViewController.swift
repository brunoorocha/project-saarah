//
//  NavigationDrawerViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 04/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class NavigationDrawerViewController: UIViewController, NavigationDrawerDelegate {
    var menuOptions: [NavigationDrawerMenu] = []

    private var leftNavigationView: NavigationDrawerView!

    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
        setupLeftNavigationView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupLeftNavigationView() {
        leftNavigationView = NavigationDrawerView(withNavigationOptions: menuOptions)
        leftNavigationView.delegate = self
        view = leftNavigationView
    }

    func didSelectOptionAt(index: Int) {}
}
