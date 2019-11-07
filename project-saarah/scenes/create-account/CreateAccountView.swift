//
//  CreateAccountView.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class CreateAccountView: UIView {
	var tableView: SaarahTableView!

	init() {
		super.init(frame: .zero)

		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = UIColor.white

		instantiateViews()
		buildViewsHierarchy()
		setupConstraints()

        tableView.keyboardDismissMode = .onDrag
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func instantiateViews() {
		tableView = SaarahTableView()
	}

	func buildViewsHierarchy() {
		addSubview(tableView)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			tableView.topAnchor.constraint(equalTo: topAnchor),
			tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
