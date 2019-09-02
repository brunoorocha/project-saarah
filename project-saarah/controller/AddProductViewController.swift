//
//  AddProductViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class AddProductViewController: UIViewController, ConfigurableController {
	var contentView: UIView? = AddProductView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupContentView()
	}
}
