//
//  ButtonPurpleTableViewCell.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class PurpleButtonTableViewCell: SaarahTableViewCell {

    var button: SaarahButton = {
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
        cellContentView.addSubviews([button])

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: cellContentView.topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: mediumMargin),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -mediumMargin),
            button.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor),

            button.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    func setTitle(with title: String) {
        button.setTitle(title, for: .normal)
    }
}
