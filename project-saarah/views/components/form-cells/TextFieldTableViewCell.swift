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
    var errorLabel = FieldErrorLabel()

    private var arrowRightIcon = SaarahIconImageView(image: AppStyleGuide.Icons.chevronRight.uiImage)

    private var separator = SaarahTableViewSeparator()

    private let mediumMargin = AppStyleGuide.Margins.medium.rawValue

    override func configureCellComponents() {
        cellContentView.addSubviews([fieldLabel, textField, errorLabel, arrowRightIcon, separator])
        contentView.isUserInteractionEnabled = true

        arrowRightIcon.isHidden = true
        let xsmallMargin = AppStyleGuide.Margins.xsmall.rawValue
        let smallMargin = AppStyleGuide.Margins.small.rawValue

        NSLayoutConstraint.activate([
            fieldLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: smallMargin),
            fieldLabel.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: mediumMargin),
            fieldLabel.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -mediumMargin),

            textField.topAnchor.constraint(equalTo: fieldLabel.bottomAnchor, constant: xsmallMargin),
            textField.leadingAnchor.constraint(equalTo: fieldLabel.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: arrowRightIcon.leadingAnchor, constant: -mediumMargin),

            errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: xsmallMargin),
            errorLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -smallMargin),

            arrowRightIcon.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -mediumMargin),
            arrowRightIcon.centerYAnchor.constraint(equalTo: cellContentView.centerYAnchor),

            separator.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: mediumMargin),
            separator.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor)
        ])
    }

    func clearErrors () {
        errorLabel.text = ""
    }

    func showDisclosureIndicator() {
        arrowRightIcon.isHidden = false
    }
}
