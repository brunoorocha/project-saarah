//
//  HomeCardCollectionViewCell.swift
//  project-saarah
//
//  Created by Bruno Rocha on 28/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeCardCollectionViewCell: UICollectionViewCell {
    var cardTitle = Heading3Label()
    var cardIcon = SaarahIconImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultCellConfiguration()
        configureCellComponents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func defaultCellConfiguration () {
        contentView.backgroundColor = AppStyleGuide.Colors.foreground.uiColor
        contentView.layer.cornerRadius = AppStyleGuide.Sizes.cornerRadius.rawValue
    }

    private func configureCellComponents () {
        contentView.addSubviews([cardTitle, cardIcon])

        let mediumMargin = AppStyleGuide.Margins.medium.rawValue
        let smallMargin = AppStyleGuide.Margins.small.rawValue

        cardTitle.anchor(
            top: cardIcon.bottomAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.topAnchor,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(top: smallMargin, left: mediumMargin, bottom: smallMargin, right: mediumMargin)
        )

        cardIcon.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            padding: UIEdgeInsets(top: mediumMargin, left: mediumMargin, bottom: .zero, right: .zero)
        )
    }
}
