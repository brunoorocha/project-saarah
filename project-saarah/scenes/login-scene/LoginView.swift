//
//  LoginView.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class LoginView: UIView {

    var tableView: SaarahTableView!

	init() {
		super.init(frame: .zero)

		backgroundColor = UIColor.white

		instantiateViews()
		buildViewsHierarchy()
		setupConstraints()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func instantiateViews() {
        tableView = SaarahTableView()
        tableView.keyboardDismissMode = .onDrag
	}

	func buildViewsHierarchy() {
        addSubview(tableView)
	}

	func setupConstraints() {
        let height: CGFloat = 160
        let header = headerView(height: height)
        // Necessary to set status bar color
        backgroundColor = AppStyleGuide.Colors.background.uiColor
        tableView.tableHeaderView = header
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),

            header.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 16),
            header.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            header.widthAnchor.constraint(equalTo: tableView.widthAnchor)
        ])
        header.frame.size = CGSize(width: .zero, height: (height))
	}

    // MARK: Header and footer
    func headerView(height: CGFloat) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logo")
        view.addSubview(imageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 16),
            imageView.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: height)
        ])
        return view
    }
}
