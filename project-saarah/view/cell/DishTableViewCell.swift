//
//  DishTableViewCell.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 10/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class DishTableViewCell: UITableViewCell {
	var dishViewModel: DishViewModel! {
		didSet {
			dishImageView.image = dishViewModel.image
			nameLabel.text = dishViewModel.name
			descriptionLabel.text = dishViewModel.description
			priceLabel.text = "\(dishViewModel.price)"
		}
	}

	private let dishImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.backgroundColor = .red

		imageView.layer.masksToBounds = true
		imageView.layer.cornerRadius = 16.0

		// This enables autolayout to imageView.
		imageView.translatesAutoresizingMaskIntoConstraints = false

		return imageView
	}()

	private let nameLabel: UILabel = Label(frame: .zero)
	private let descriptionLabel: UILabel = Label(frame: .zero)
	private let priceLabel: UILabel = Label(frame: .zero)

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		backgroundColor = .white

		setupLayout()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder aDecoder: ) has not been implemented.")
	}

	private func setupLayout() {
		// This is a auxiliar view for the main content.
		let contentView: UIView = {
			let view = UIView()
			view.backgroundColor = .blue

			view.layer.masksToBounds = true
			view.layer.cornerRadius = 16.0

			// This enables autolayout to view.
			view.translatesAutoresizingMaskIntoConstraints = false

			return view
		}()

		// Add subviews to cell.
		addSubviews([contentView, dishImageView])

		// Add subviews to containerView.
		contentView.addSubviews([nameLabel, descriptionLabel, priceLabel])

		// Constraints for containerView, dishImageName, dishName, dishDescription, dishPrice.
		NSLayoutConstraint.activate([
			contentView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
			contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0),
			contentView.leadingAnchor.constraint(equalTo: dishImageView.leadingAnchor, constant: 48.0),
			contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),

			dishImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
			dishImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
			dishImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
			dishImageView.widthAnchor.constraint(equalToConstant: 96.0),

			nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
			nameLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: dishImageView.trailingAnchor, constant: 8.0),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),

			descriptionLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 8.0),
			descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
			descriptionLabel.leadingAnchor.constraint(equalTo: dishImageView.trailingAnchor, constant: 8.0),
			descriptionLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8.0),

			priceLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 8.0),
			priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
			priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
			priceLabel.widthAnchor.constraint(equalToConstant: 64.0)
		])
	}
}
