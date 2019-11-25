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
    var navigationBar: UINavigationBar?
	var tableView: SaarahTableView!

	weak var delegate: AddNewProductViewDelegate?

    init(hasNavigate: Bool = false) {
		super.init(frame: .zero)

		backgroundColor = AppStyleGuide.Colors.background.uiColor

        if !hasNavigate {
            setNavigation()
        }

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
		tableView = SaarahTableView()
	}

    func setNavigation() {
        let navbarTitleAttributes = [
            NSAttributedString.Key.font: AppStyleGuide.Typography.heading3.uiFont,
            NSAttributedString.Key.foregroundColor: AppStyleGuide.Colors.textColor.uiColor
        ]

        navigationBar = UINavigationBar()
        guard let navigationBar = navigationBar else { return }

        navigationBar.titleTextAttributes = navbarTitleAttributes

        let navigationItem = UINavigationItem(title: "\(Localization(.addNewProductScene(.title)))")

        let leftButton = UIBarButtonItem(title: "\(Localization(.addNewProductScene(.cancelBarButton)))", style: .plain, target: self, action: #selector(cancelButtonAction))

        let rightButton = UIBarButtonItem(title: "\(Localization(.addNewProductScene(.saveBarButton)))", style: .done, target: self, action: #selector(saveButtonAction))

        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton

        navigationBar.setItems([navigationItem], animated: false)
    }

	func buildViewsHierarchy() {
        if let navigationBar = navigationBar {
            addSubview(navigationBar)
        }
        addSubview(tableView)
	}

	func setupConstraints() {
        if let navigationBar = navigationBar {
            navigationBar.anchor(
                top: topAnchor,
                leading: leadingAnchor,
                trailing: trailingAnchor
            )
            tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        } else {
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        }

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
}
