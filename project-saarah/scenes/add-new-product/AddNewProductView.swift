//
//  AddNewProductView.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddNewProductViewDelegate: class {
	func cancelAction()
	func saveAction()
}

class AddNewProductView: UIView {
    var navigationBar = UINavigationBar()
	var tableView: SaarahTableView!

	weak var delegate: AddNewProductViewDelegate?

	init() {
		super.init(frame: .zero)

        backgroundColor = AppStyleGuide.Colors.foreground.uiColor

		instantiateViews()
		buildViewsHierarchy()
		setupConstraints()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	@objc func cancelButtonAction() {
		delegate?.cancelAction()
	}

	@objc func saveButtonAction() {
		delegate?.saveAction()
	}

	func instantiateViews() {
        let navbarTitleAttributes = [
            NSAttributedString.Key.font: AppStyleGuide.Typography.heading3.uiFont,
            NSAttributedString.Key.foregroundColor: AppStyleGuide.Colors.textColor.uiColor
        ]

        navigationBar.backgroundColor = AppStyleGuide.Colors.foreground.uiColor
        navigationBar.titleTextAttributes = navbarTitleAttributes

        let navigationItem = UINavigationItem(title: "\(Localization(.addNewProductScene(.title)))")

        let leftButton = UIBarButtonItem(title: "\(Localization(.addNewProductScene(.cancelBarButton)))", style: .plain, target: self, action: #selector(cancelButtonAction))

        let rightButton = UIBarButtonItem(title: "\(Localization(.addNewProductScene(.saveBarButton)))", style: .done, target: self, action: #selector(saveButtonAction))

        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton

        navigationBar.setItems([navigationItem], animated: false)

		tableView = SaarahTableView()
	}

	func buildViewsHierarchy() {
        addSubviews([navigationBar, tableView])
	}

	func setupConstraints() {
        navigationBar.anchor(
            top: layoutMarginsGuide.topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor
        )

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
}
