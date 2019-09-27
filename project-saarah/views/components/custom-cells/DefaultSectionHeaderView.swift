//
//  DefaultSectionHeaderView.swift
//  project-saarah
//
//  Created by Bruno Rocha on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class DefaultSectionHeaderView: UIView {
    var titleLabel = CaptionBoldLabel()
    var rightButton = CaptionButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurateViewComponents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurateViewComponents () {
        backgroundColor = AppStyleGuide.Colors.background.uiColor
        addSubviews([titleLabel, rightButton])

        let smallMargin = AppStyleGuide.Margins.small.rawValue
        let largeMargin = AppStyleGuide.Margins.large.rawValue

        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -smallMargin),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: largeMargin),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: rightButton.leadingAnchor, constant: -largeMargin),

            rightButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -smallMargin),
            rightButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -largeMargin),

            heightAnchor.constraint(equalToConstant: 48.0)
        ])
    }
}
