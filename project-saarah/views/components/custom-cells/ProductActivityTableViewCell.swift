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

        NSLayoutConstraint.activate([
            activityIcon.widthAnchor.constraint(equalToConstant: 32.0),
            activityIcon.heightAnchor.constraint(equalToConstant: 32.0),
            activityIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            activityIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),

            labelsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            labelsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelsView.leadingAnchor.constraint(equalTo: activityIcon.trailingAnchor, constant: 16.0),

            dateLabel.topAnchor.constraint(equalTo: labelsView.topAnchor, constant: 16.0),
            dateLabel.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -4.0),

            label.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor, constant: -16.0),

            separator.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor, constant: -1.0),
            separator.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor)
        ])
    }
}
