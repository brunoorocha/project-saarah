//
//  ProductActivityTableViewCell.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductActivityTableViewCell: SaarahTableViewCell {
    var dateLabel = CaptionLabel()
    var label = ParagraphLabel()
    var activityIcon = SaarahImageView()

    private var separator = SaarahTableViewSeparator()
    private var arrowRightIcon = SaarahIconImageView(image: AppStyleGuide.Icons.chevronRight.uiImage)

    var labelsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func configureCellComponents () {
        labelsView.addSubviews([dateLabel, label, separator, arrowRightIcon])
        cellContentView.addSubviews([activityIcon, labelsView])

        let xSmallMargin = AppStyleGuide.Margins.xsmall.rawValue
        let mediumMargin = AppStyleGuide.Margins.medium.rawValue
        let largeMargin = AppStyleGuide.Margins.large.rawValue

        NSLayoutConstraint.activate([
            activityIcon.widthAnchor.constraint(equalToConstant: largeMargin),
            activityIcon.heightAnchor.constraint(equalToConstant: largeMargin),
            activityIcon.centerYAnchor.constraint(equalTo: cellContentView.centerYAnchor),
            activityIcon.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: mediumMargin),

            labelsView.topAnchor.constraint(equalTo: cellContentView.topAnchor),
            labelsView.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor),
            labelsView.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor),
            labelsView.leadingAnchor.constraint(equalTo: activityIcon.trailingAnchor, constant: mediumMargin),

            dateLabel.topAnchor.constraint(equalTo: labelsView.topAnchor, constant: mediumMargin),
            dateLabel.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -xSmallMargin),

            label.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor),
            label.trailingAnchor.constraint(lessThanOrEqualTo: arrowRightIcon.leadingAnchor, constant: -mediumMargin),
            label.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor, constant: -mediumMargin),

            arrowRightIcon.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor, constant: -mediumMargin),
            arrowRightIcon.centerYAnchor.constraint(equalTo: labelsView.centerYAnchor),

            separator.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor)
        ])
    }
}
