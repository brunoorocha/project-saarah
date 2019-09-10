//
//  MenuTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 09/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    var dish: Dish? {
        didSet {
            guard let unwrappedDish = dish else { return }

            dishImageName.image = UIImage(named: unwrappedDish.dishImageName)
            dishName.text = unwrappedDish.dishName
            dishDescription.text = unwrappedDish.dishDescription
            dishPrice.text = "\(unwrappedDish.dishPrice)"
        }
    }

    private let dishImageName: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red

        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 16.0

        // This enables autolayout to imageView.
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let dishName: UILabel = Label(frame: .zero)
    private let dishDescription: UILabel = Label(frame: .zero)
    private let dishPrice: UILabel = Label(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .white

        setupLayout()
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
        addSubviews([contentView, dishImageName])

        // Add subviews to containerView.
        contentView.addSubviews([dishName, dishDescription, dishPrice])

        // Constraints for containerView, dishImageName, dishName, dishDescription, dishPrice.
        NSLayoutConstraint.activate(
            [
                contentView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
                contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0),
                contentView.leadingAnchor.constraint(equalTo: dishImageName.leadingAnchor, constant: 48.0),
                contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),

                dishImageName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
                dishImageName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
                dishImageName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
                dishImageName.widthAnchor.constraint(equalToConstant: 96.0),

                dishName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
                dishName.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
                dishName.leadingAnchor.constraint(equalTo: dishImageName.trailingAnchor, constant: 8.0),
                dishName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),

                dishDescription.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 8.0),
                dishDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
                dishDescription.leadingAnchor.constraint(equalTo: dishImageName.trailingAnchor, constant: 8.0),
                dishDescription.trailingAnchor.constraint(equalTo: dishPrice.leadingAnchor, constant: -8.0),

                dishPrice.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 8.0),
                dishPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
                dishPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
                dishPrice.widthAnchor.constraint(equalToConstant: 64.0)
            ]
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
