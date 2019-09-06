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
        setupAddButton()
	}

	@objc func addButtonAction() {
		let addProductVC = AddProductViewController()
		addProductVC.delegate = self
		
		present(addProductVC, animated: true, completion: nil)
	}

	func setupAddButton() {
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonAction))
		navigationItem.rightBarButtonItem = addButton
	}
}

extension ProductsViewController: AddProductViewControllerDelegate {
	func productAdded() {
		if let productsView = contentView as? ProductsView {
			productsView.tableView.reloadData()
		}
	}
}
