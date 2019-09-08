//
//  ProductsViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductsListViewController: UIViewController, ConfigurableController {
	var contentView: UIView? = ProductsView()

	override func viewDidLoad() {
		super.viewDidLoad()

		setupContentView()
        setupAddButton()
        loadAndPresentProducts()
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

    private func loadAndPresentProducts() {
        guard let view = contentView as? ProductsView else { return }

        let productRepository = ProductRepository()
        let products = productRepository.getAll()
        let productListViewModels = products.map { product -> ProductsListViewModel in
            let productName = product.name ?? ""
            let productQuantity = String(format: "%.2f", product.quantity)
            let productsListViewModel = ProductsListViewModel(name: productName, quantity: productQuantity)
            return productsListViewModel
        }

        view.productListViewModels = productListViewModels
        view.tableView.reloadData()
    }
}

extension ProductsListViewController: AddProductViewControllerDelegate {
	func productAdded() {
		loadAndPresentProducts()
	}
}
