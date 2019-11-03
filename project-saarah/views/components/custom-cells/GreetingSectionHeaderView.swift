//
//  GreetingTableViewCell.swift
//  project-saarah
//
//  Created by Thiago Valente on 30/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class GreetingSectionHeaderView: UIView {
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Olá de novo!"
        label.textAlignment = .left
        label.font = AppStyleGuide.Typography.heading2.uiFont
        return label
    }()
    
    var descriptionLabel: UILabel = {
        var label = UILabel()
        label.text = "Entre na sua conta para continuar"
        label.textAlignment = .left
        label.font = AppStyleGuide.Typography.heading3.uiFont
        label.textColor = AppStyleGuide.Colors.primary.uiColor
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

        let smallMargin = AppStyleGuide.Margins.small.rawValue
        let mediumMargin = AppStyleGuide.Margins.medium.rawValue

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: mediumMargin),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: mediumMargin),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -mediumMargin),
            descriptionLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: smallMargin),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: mediumMargin),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -mediumMargin),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
