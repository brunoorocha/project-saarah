//
//  GreetingTableViewCell.swift
//  project-saarah
//
//  Created by Thiago Valente on 30/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class GreetingSectionHeaderView: UIView {

    var titleLabel = Heading2Label()
    var descriptionLabel = ParagraphLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurateViewComponents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurateViewComponents () {
        addSubviews([titleLabel, descriptionLabel])

        titleLabel.textColor = AppStyleGuide.Colors.primary.uiColor

        let mediumMargin = AppStyleGuide.Margins.medium.rawValue

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: mediumMargin),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: mediumMargin),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -mediumMargin),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: mediumMargin),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -mediumMargin),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -mediumMargin)
        ])
    }

    func setTitle(with title: String, andDescription description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}
