//
//  SelectableCell.swift
//  project-saarah
//
//  Created by Bruno Rocha on 27/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SelectableCell: SaarahTableViewCell {
    var label = Heading3Label()
    var isChecked: Bool = false {
        didSet {
            checkIcon.isHidden = !self.isChecked
        }
    }

    private var separator = TableViewSeparator()
    private var checkIcon = SaarahIconImageView(image: AppStyleGuide.Icons.check.uiImage)

    override func configureCellComponents() {
        contentView.addSubviews([label, checkIcon, separator])
        checkIcon.isHidden = !isChecked

        let mediumMargin = AppStyleGuide.Margins.medium.rawValue

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: mediumMargin),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: mediumMargin),
            label.trailingAnchor.constraint(lessThanOrEqualTo: checkIcon.leadingAnchor, constant: -mediumMargin),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -mediumMargin),

            checkIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -mediumMargin),
            checkIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: mediumMargin),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
