//
//  ProductTableViewCell.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
	var productNameLabel: UILabel!
	var productQuantityLabel: UILabel!

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		selectionStyle = .none

		instantiateViews()
		buildViewsHierarchy()
		setupConstraints()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setViewModel(_ viewModel: ProductsListViewModel) {
		productNameLabel.text = viewModel.name
		productQuantityLabel.text = viewModel.quantity
	}

	func instantiateViews() {
		productNameLabel = UILabel(frame: .zero)
		productNameLabel.translatesAutoresizingMaskIntoConstraints = false
		productQuantityLabel = UILabel(frame: .zero)
		productQuantityLabel.translatesAutoresizingMaskIntoConstraints = false
	}

	func buildViewsHierarchy() {
		contentView.addSubview(productNameLabel)
		contentView.addSubview(productQuantityLabel)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			productNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			productNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
			productNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			productQuantityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			productQuantityLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor),
			productQuantityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			productQuantityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}
