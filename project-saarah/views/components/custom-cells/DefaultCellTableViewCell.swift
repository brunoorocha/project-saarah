//
//  DefaultCellTableViewCell.swift
//  project-saarah
//
//  Created by Bruno Rocha on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class DefaultCellTableViewCell: SaarahTableViewCell {
    var label = Heading3Label()
    var detailLabel = Heading3Label()

    private var separator = TableViewSeparator()
    private var arrowRightIcon = SaarahIconImageView(image: AppStyleGuide.Icons.chevronRight.uiImage)

    override func configureCellComponents() {
        cellContentView.addSubviews([label, detailLabel, separator, arrowRightIcon])
        detailLabel.textColor = AppStyleGuide.Colors.primary.uiColor

        let mediumMargin = AppStyleGuide.Margins.medium.rawValue

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: mediumMargin),
            label.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: mediumMargin),
            label.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -mediumMargin),
            label.trailingAnchor.constraint(lessThanOrEqualTo: detailLabel.leadingAnchor, constant: -mediumMargin),

            detailLabel.topAnchor.constraint(equalTo: label.topAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: arrowRightIcon.leadingAnchor, constant: -mediumMargin),

            arrowRightIcon.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -mediumMargin),
            arrowRightIcon.centerYAnchor.constraint(equalTo: cellContentView.centerYAnchor),

            separator.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: mediumMargin),
            separator.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor)
        ])
    }
}
