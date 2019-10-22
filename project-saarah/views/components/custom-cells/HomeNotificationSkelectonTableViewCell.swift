//
//  HomeNotificationSkelectonTableViewCell.swift
//  project-saarah
//
//  Created by Bruno Rocha on 20/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeNotificationSkelectonTableViewCell: SaarahTableViewCell {
    private var separator = SaarahTableViewSeparator()
    private var emojiView: UIView = {
        let view = UIView(cornerRadius: 16.0, backgroundColor: AppStyleGuide.Colors.lightGray.uiColor)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 32).isActive = true
        view.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return view
    }()

    override func configureCellComponents() {
        let labelSkelectonView1 = UIView()
        labelSkelectonView1.backgroundColor = AppStyleGuide.Colors.lightGray.uiColor
        let labelSkelectonView2 = UIView()
        labelSkelectonView2.backgroundColor = AppStyleGuide.Colors.lightGray.uiColor

        let mediumMargin = AppStyleGuide.Margins.medium.rawValue
        let xsmallMargin = AppStyleGuide.Margins.xsmall.rawValue
        cellContentView.addSubviews([labelSkelectonView1, labelSkelectonView2, emojiView, separator])

        labelSkelectonView1.anchor(
            top: cellContentView.topAnchor,
            leading: emojiView.trailingAnchor,
            bottom: labelSkelectonView2.topAnchor,
            padding: UIEdgeInsets(top: mediumMargin, left: mediumMargin, bottom: xsmallMargin, right: mediumMargin)
        )

        labelSkelectonView2.anchor(
            leading: labelSkelectonView1.leadingAnchor,
            bottom: cellContentView.bottomAnchor,
            padding: UIEdgeInsets(top: .zero, left: .zero, bottom: mediumMargin, right: .zero)
        )

        labelSkelectonView1.widthAnchor.constraint(equalTo: cellContentView.widthAnchor, multiplier: 0.7).isActive = true
        labelSkelectonView1.heightAnchor.constraint(equalToConstant: 16).isActive = true

        labelSkelectonView2.widthAnchor.constraint(equalTo: cellContentView.widthAnchor, multiplier: 0.4).isActive = true
        labelSkelectonView2.heightAnchor.constraint(equalToConstant: 16).isActive = true

        emojiView.anchor(
            leading: cellContentView.leadingAnchor,
            padding: UIEdgeInsets(top: .zero, left: mediumMargin, bottom: .zero, right: .zero)
        )
        emojiView.centerYAnchor.constraint(equalTo: cellContentView.centerYAnchor).isActive = true

        separator.anchor(
            leading: labelSkelectonView1.leadingAnchor,
            bottom: cellContentView.bottomAnchor,
            trailing: cellContentView.trailingAnchor
        )
    }
}
