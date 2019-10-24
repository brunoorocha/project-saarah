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
	var navigationBar: UINavigationBar!
	var tableView: SaarahTableView!

	weak var delegate: AddNewProductViewDelegate?

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
		navigationBar = UINavigationBar()
		navigationBar.translatesAutoresizingMaskIntoConstraints = false
		navigationBar.barTintColor = .white
		let navbarTitleAttributes = [
			NSAttributedString.Key.font: AppStyleGuide.Typography.heading3.uiFont,
			NSAttributedString.Key.foregroundColor: AppStyleGuide.Colors.textColor.uiColor
		]
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
		addSubview(navigationBar)
		addSubview(tableView)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
			navigationBar.topAnchor.constraint(equalTo: topAnchor),
			navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
			tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
			tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
