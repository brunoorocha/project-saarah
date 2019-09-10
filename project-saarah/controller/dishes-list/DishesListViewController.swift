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

		title = "Pratos"
		
		setupContentView()
		setupAddButton()
		
		loadMockData()
	}
	
	@objc func addButtonAction() {
		let addDishVC = AddDishViewController()
		addDishVC.delegate = self
		
		present(addDishVC, animated: true, completion: nil)
	}
	
	func setupAddButton() {
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonAction))
		navigationItem.rightBarButtonItem = addButton
	}
	
	func loadMockData() {
		let mockViewModel = DishViewModel(name: "Classic Buger", image: UIImage(), description: "Um delicioso burger", price: 20.0)
		let mocksViewModel = [mockViewModel, mockViewModel, mockViewModel]
		
		if let dishesListView = contentView as? DishesListView {
			dishesListView.dishesViewModel = mocksViewModel
			dishesListView.tableView.reloadData()
		}
	}
}

extension DishesListViewController: AddDishViewControllerDelegate {
	func dishAdded() {
		//load dishes from coredata
	}
}
