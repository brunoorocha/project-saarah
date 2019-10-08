//
//  TextFieldTableViewCell.swift
//  project-saarah
//
//  Created by Bruno Rocha on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: SaarahTableViewCell {
    var fieldLabel = Heading3Label()
    var textField = SaarahTextField()

    private var separator = SaarahTableViewSeparator()

    override func configureCellComponents() {
        cellContentView.addSubviews([fieldLabel, textField, separator])
        contentView.isUserInteractionEnabled = true

        let xsmallMargin = AppStyleGuide.Margins.xsmall.rawValue
        let smallMargin = AppStyleGuide.Margins.small.rawValue
        let mediumMargin = AppStyleGuide.Margins.medium.rawValue

        NSLayoutConstraint.activate([
            fieldLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: smallMargin),
            fieldLabel.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: mediumMargin),
            fieldLabel.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -mediumMargin),

            textField.topAnchor.constraint(equalTo: fieldLabel.bottomAnchor, constant: xsmallMargin),
            textField.leadingAnchor.constraint(equalTo: fieldLabel.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: fieldLabel.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -smallMargin),

            separator.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: mediumMargin),
            separator.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor)
        ])
    }
}
