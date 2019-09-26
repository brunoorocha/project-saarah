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

    private var separator = TableViewSeparator()

    override func configureCellComponents() {
        contentView.addSubviews([fieldLabel, textField, separator])
        contentView.isUserInteractionEnabled = true

        let xsmallMargin = AppStyleGuide.Margins.xsmall.rawValue
        let smallMargin = AppStyleGuide.Margins.small.rawValue
        let mediumMargin = AppStyleGuide.Margins.medium.rawValue

        NSLayoutConstraint.activate([
            fieldLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: smallMargin),
            fieldLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: mediumMargin),
            fieldLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -mediumMargin),

            textField.topAnchor.constraint(equalTo: fieldLabel.bottomAnchor, constant: xsmallMargin),
            textField.leadingAnchor.constraint(equalTo: fieldLabel.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: fieldLabel.trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -smallMargin),

            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: mediumMargin),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
