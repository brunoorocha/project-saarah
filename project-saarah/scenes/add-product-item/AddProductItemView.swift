//
//  AddProductItemView.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddProductItemViewDelegate: class {
	func cancelAction()
	func saveAction()
}

class AddProductItemView: UIView {
	var navigationBar = UINavigationBar()
	var tableView: SaarahTableView!

	weak var delegate: AddProductItemViewDelegate?

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

		navigationBar.titleTextAttributes = navbarTitleAttributes

        let navigationItem = UINavigationItem(title: Localization(.addProductItemScene(.title)).description)

        let leftButton = UIBarButtonItem(title: Localization(.addProductItemScene(.barButton(.cancel))).description, style: .plain, target: self, action: #selector(cancelButtonAction))

		let rightButton = UIBarButtonItem(title: Localization(.addProductItemScene(.barButton(.save))).description, style: .done, target: self, action: #selector(saveButtonAction))

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
            top: topAnchor,
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
