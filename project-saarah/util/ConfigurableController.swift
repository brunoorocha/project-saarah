//
//  ConfigurableController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 23/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol ConfigurableController: UIViewController {
	var contentView: UIView? { get set }

	func setupContentView()
	func addContentView()
	func setupContentViewConstraints()
}

extension ConfigurableController {
	func setupContentView() {
		addContentView()
		setupContentViewConstraints()
	}

	func addContentView() {
		guard let myView = contentView else { return print("You should pass view") }
		view.addSubview(myView)
	}

	func setupContentViewConstraints() {
		if let myView = contentView {
			NSLayoutConstraint.activate([
				myView.topAnchor.constraint(equalTo: view.topAnchor),
				myView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
				myView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
				myView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
			])
		}
	}
}
