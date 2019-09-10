//
//  DishesListViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 10/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class DishesListViewController: UIViewController, ConfigurableController {
	var contentView: UIView? = DishesListView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupContentView()
	}
}
