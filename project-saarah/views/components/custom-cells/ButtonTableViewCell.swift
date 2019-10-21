//
//  ButtonTableViewCell.swift
//  project-saarah
//
//  Created by Thiago Valente on 21/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ButtonTableViewCell: SaarahTableViewCell {

    private let addIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "add-icon")
        imageView.contentMode = .scaleAspectFill

        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8.0
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    var buttonLabel: SaarahButton = {
        var button = SaarahButton()
        button.setTitle("\(Localization(.buttonTableViewCell(.title)))", for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()

    let smallMargin = AppStyleGuide.Margins.small.rawValue
    let mediumMargin = AppStyleGuide.Margins.medium.rawValue

    override func configureCellComponents() {
        cellContentView.addSubviews([addIconImageView, buttonLabel])

        NSLayoutConstraint.activate([
            addIconImageView.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: mediumMargin),
            addIconImageView.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -mediumMargin),
            addIconImageView.leftAnchor.constraint(equalTo: cellContentView.leftAnchor, constant: mediumMargin),
            addIconImageView.widthAnchor.constraint(equalToConstant: mediumMargin),
            addIconImageView.heightAnchor.constraint(equalToConstant: mediumMargin),

            buttonLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: mediumMargin),
            buttonLabel.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -mediumMargin),
            buttonLabel.leftAnchor.constraint(equalTo: addIconImageView.rightAnchor, constant: smallMargin),
            buttonLabel.rightAnchor.constraint(equalTo: cellContentView.rightAnchor, constant: -mediumMargin)
        ])

    }
}
