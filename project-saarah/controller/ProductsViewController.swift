//
//  ProductsViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, ConfigurableController {
	var contentView: UIView? = ProductsView()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupContentView()
	}
}
