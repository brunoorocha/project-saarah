//
//  ProductItemView.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductItemView: UIView {
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
	}

	func buildViewsHierarchy() {
	}

	func setupConstraints() {
	}
}
