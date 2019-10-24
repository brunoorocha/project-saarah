//
//  HomeNotificationTableViewCell.swift
//  project-saarah
//
//  Created by Bruno Rocha on 29/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeNotificationTableViewCell: SaarahTableViewCell {
    var messageLabel = ParagraphLabel()
    var emojiLabel = ParagraphLabel()
    var type = HomeNotificationType.normal {
        didSet {
            emojiView.backgroundColor = emojiViewBackgroundColor
        }
    }

    private var emojiViewBackgroundColor: UIColor {
        switch type {
        case .normal:
            return AppStyleGuide.Colors.lightPurple.uiColor
        case .alert:
            return AppStyleGuide.Colors.lightRed.uiColor
        case .warning:
            return AppStyleGuide.Colors.lightYellow.uiColor
        }
    }

    private var separator = SaarahTableViewSeparator()
//    private var arrowRightIcon = SaarahIconImageView(image: AppStyleGuide.Icons.chevronRight.uiImage)
    private var emojiView: UIView = {
        let view = UIView(cornerRadius: 16.0, backgroundColor: AppStyleGuide.Colors.lightGray.uiColor)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 32).isActive = true
        view.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return view
    }()

    override func configureCellComponents() {
        emojiView.addSubview(emojiLabel)
        emojiLabel.centerXAnchor.constraint(equalTo: emojiView.centerXAnchor).isActive = true
        emojiLabel.centerYAnchor.constraint(equalTo: emojiView.centerYAnchor).isActive = true

        let mediumMargin = AppStyleGuide.Margins.medium.rawValue
        cellContentView.addSubviews([messageLabel, emojiView, separator])

        messageLabel.anchor(
            top: cellContentView.topAnchor,
            leading: emojiView.trailingAnchor,
            bottom: cellContentView.bottomAnchor,
//            trailing: arrowRightIcon.leadingAnchor,
            padding: UIEdgeInsets(top: mediumMargin, left: mediumMargin, bottom: mediumMargin, right: mediumMargin)
        )
        messageLabel.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -mediumMargin).isActive = true
        messageLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 44).isActive = true

        emojiView.anchor(
            leading: cellContentView.leadingAnchor,
            padding: UIEdgeInsets(top: .zero, left: mediumMargin, bottom: .zero, right: .zero)
        )
        emojiView.centerYAnchor.constraint(equalTo: cellContentView.centerYAnchor).isActive = true
        emojiView.backgroundColor = emojiViewBackgroundColor

        separator.anchor(
            leading: messageLabel.leadingAnchor,
            bottom: cellContentView.bottomAnchor,
            trailing: cellContentView.trailingAnchor
        )

//        arrowRightIcon.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -mediumMargin).isActive = true
//        arrowRightIcon.centerYAnchor.constraint(equalTo: cellContentView.centerYAnchor).isActive = true
    }
}
