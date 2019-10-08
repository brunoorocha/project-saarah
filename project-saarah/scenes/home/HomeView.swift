//
//  HomeView.swift
//  project-saarah
//
//  Created by Bruno Rocha on 29/09/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class HomeView: UIView {
    var tableView = SaarahTableView()

    enum HomeTableViewSections: Int, CaseIterable {
        case menu = 0
        case notifications
    }

    var tableViewSections = HomeTableViewSections.allCases

	init() {
        super.init(frame: .zero)

        backgroundColor = AppStyleGuide.Colors.background.uiColor
		instantiateViews()
		buildViewsHierarchy()
		setupConstraints()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func instantiateViews() {}

	func buildViewsHierarchy() {
        addSubview(tableView)
	}

	func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
	}
}