//
//  RegisterSectionFooterView.swift
//  project-saarah
//
//  Created by Thiago Valente on 06/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class RegisterSectionFooterView: UIView {
    var titleLabel = ParagraphLabel()
    var actionRegisterButton = SaarahButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurateViewComponents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurateViewComponents () {
        backgroundColor = AppStyleGuide.Colors.background.uiColor
        addSubviews([titleLabel, actionRegisterButton])

        titleLabel.textAlignment = .center

        titleLabel.text = Localization(.registerSectionFooterView(.title)).description
        actionRegisterButton.setTitle(Localization(.registerSectionFooterView(.registerButton)).description, for: .normal)

        let smallMargin = AppStyleGuide.Margins.small.rawValue
        let mediumMargin = AppStyleGuide.Margins.medium.rawValue
        let largeMargin = AppStyleGuide.Margins.large.rawValue

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: largeMargin),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: smallMargin),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -smallMargin),
            actionRegisterButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: smallMargin),
            actionRegisterButton.leftAnchor.constraint(equalTo: leftAnchor, constant: smallMargin),
            actionRegisterButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -smallMargin),
            actionRegisterButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -mediumMargin)
        ])
    }
}
