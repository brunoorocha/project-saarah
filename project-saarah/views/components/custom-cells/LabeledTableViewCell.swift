//
//  LabeledTableViewCell.swift
//  project-saarah
//
//  Created by Thiago Valente on 18/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class LabeledTableViewCell: SaarahTableViewCell {
    var productLabel = Heading3Label()
    var productNameLabel = ParagraphLabel()

    private var separator = SaarahTableViewSeparator()

    override func configureCellComponents() {
        cellContentView.addSubviews([productLabel, productNameLabel, separator])

        let xSmallMargin = AppStyleGuide.Margins.xsmall.rawValue
        let smallMargin = AppStyleGuide.Margins.small.rawValue
        let mediumMargin = AppStyleGuide.Margins.medium.rawValue

        NSLayoutConstraint.activate([
            productLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: smallMargin),
            productLabel.leftAnchor.constraint(equalTo: cellContentView.leftAnchor, constant: mediumMargin),
            productLabel.rightAnchor.constraint(equalTo: cellContentView.rightAnchor, constant: -mediumMargin),

            productNameLabel.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: xSmallMargin),
            productNameLabel.leftAnchor.constraint(equalTo: cellContentView.leftAnchor, constant: mediumMargin),
            productNameLabel.rightAnchor.constraint(equalTo: cellContentView.rightAnchor, constant: -mediumMargin),
            productNameLabel.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -smallMargin),

            separator.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: mediumMargin),
            separator.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor)
        ])
    }

    public func setContent(title: String, subtitle: String) {
        productLabel.text = title
        productNameLabel.text = subtitle
    }

    public func setupProductName(withName name: String) {
        productNameLabel.text = name
    }
}
