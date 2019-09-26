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
    var separator = TableViewSeparator()

    var labelsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func configureCellComponents () {
        labelsView.addSubviews([dateLabel, label, separator])
        contentView.addSubviews([activityIcon, labelsView])

        let xSmallMargin = AppStyleGuide.Margins.xsmall.rawValue
        let mediumMargin = AppStyleGuide.Margins.medium.rawValue
        let largeMargin = AppStyleGuide.Margins.large.rawValue

        NSLayoutConstraint.activate([
            activityIcon.widthAnchor.constraint(equalToConstant: largeMargin),
            activityIcon.heightAnchor.constraint(equalToConstant: largeMargin),
            activityIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            activityIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: mediumMargin),

            labelsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelsView.leadingAnchor.constraint(equalTo: activityIcon.trailingAnchor, constant: mediumMargin),

            dateLabel.topAnchor.constraint(equalTo: labelsView.topAnchor, constant: mediumMargin),
            dateLabel.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -xSmallMargin),

            label.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor, constant: -mediumMargin),

            separator.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor)
        ])
    }
}
