//
//  GreetingTableViewCell.swift
//  project-saarah
//
//  Created by Thiago Valente on 30/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class GreetingSectionHeaderView: UIView {
    var titleLabel: Heading2Label = {
        var label = Heading2Label()
        label.text = "\(Localization(.greetingHeaderView(.title)))"
        return label
    }()

    var descriptionLabel: ParagraphLabel = {
        var label = ParagraphLabel()
        label.text = "\(Localization(.greetingHeaderView(.paragraph)))"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurateViewComponents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurateViewComponents () {
        addSubviews([titleLabel, descriptionLabel])

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
}
