//
//  AddDishViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 10/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class AddDishViewController: UIViewController, ConfigurableController {

	var contentView: UIView? = AddDishView()

	override func viewDidLoad() {
		super.viewDidLoad()

		setupContentView()
	}
}
