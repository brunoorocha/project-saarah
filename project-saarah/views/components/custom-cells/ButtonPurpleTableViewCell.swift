//
//  ButtonPurpleTableViewCell.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ButtonPurpleTableViewCell: SaarahTableViewCell {

    var buttonLabel: SaarahButton = {
        var button = SaarahButton()
        button.setTitleColor(AppStyleGuide.Colors.lightGray.uiColor, for: .normal)
        button.backgroundColor = .none
        button.contentHorizontalAlignment = .center
        button.isUserInteractionEnabled = false
        return button
    }()

    let smallMargin = AppStyleGuide.Margins.small.rawValue
    let mediumMargin = AppStyleGuide.Margins.medium.rawValue

    override func configureCellComponents() {
        cellContentView.backgroundColor = AppStyleGuide.Colors.primary.uiColor
        cellContentView.layer.cornerRadius = 8
        cellContentView.addSubviews([buttonLabel])

        NSLayoutConstraint.activate([
            buttonLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor),
            buttonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: mediumMargin),
            buttonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -mediumMargin),
            buttonLabel.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor),

            buttonLabel.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    func setTitle(with title: String) {
        buttonLabel.setTitle(title, for: .normal)
    }
}
