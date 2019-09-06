//
//  ProductsView.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductsView: UIView {
	var tableView: UITableView!
	
	var products: [Product] = []

	init() {
		super.init(frame: .zero)

		translatesAutoresizingMaskIntoConstraints = false

		instantiateViews()
		buildViewHierarchy()
		setupConstraints()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func instantiateViews() {
		let productRepository = ProductRepository()
		products = productRepository.getAll()
		
		tableView = UITableView(frame: .zero, style: .plain)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = UIColor.white
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "ProductTableViewCell")
	}

	func buildViewHierarchy() {
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

extension ProductsView: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return products.count
	}

	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		let deleteAction = UITableViewRowAction(style: .destructive, title: "Apagar produto") { (_ , _) in
			let confirmAlert = UIAlertController(title: "Apagar produtor", message: "Você realmente deseja apagar esse produto?", preferredStyle: .actionSheet)
			confirmAlert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (_) in
				confirmAlert.dismiss(animated: true, completion: nil)
			}))
			confirmAlert.addAction(UIAlertAction(title: "Deletar", style: .destructive, handler: { (_) in
				print("deletar produto")
			}))
		}

		return [deleteAction]
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }

		let product = products[indexPath.row]
		cell.setContent(product)

		return cell
	}
}
