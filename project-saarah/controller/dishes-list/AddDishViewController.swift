//
//  AddDishViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 10/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddDishViewControllerDelegate: class {
	func dishAdded()
}

class AddDishViewController: UIViewController, ConfigurableController {
	var contentView: UIView? = AddDishView()
	
	weak var delegate: AddDishViewControllerDelegate?

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		modalPresentationStyle = .formSheet
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		setupContentView()
		
		if let addDishView = contentView as? AddDishView {
			addDishView.delegate = self
		}
	}
}

extension AddDishViewController: AddDishViewDelegate {
	func dismiss() {
		dismiss(animated: true, completion: nil)
	}
	
	func dishAdded(_ dictionary: [String : Any]) {
		print("dishadde")
	}
}
