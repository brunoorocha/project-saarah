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
    var cardIcon = SaarahImageView()

    var highlightedColor = AppStyleGuide.Colors.foreground.uiColor

    override var isSelected: Bool {
        didSet {
//            if self.isSelected {
//                contentView.backgroundColor = highlightedColor
//                cardTitle.textColor = AppStyleGuide.Colors.foreground.uiColor
//                return
//            }
//
//            contentView.backgroundColor = AppStyleGuide.Colors.foreground.uiColor
//            cardTitle.textColor = AppStyleGuide.Colors.textColor.uiColor
        }
    }

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
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(top: smallMargin, left: mediumMargin, bottom: smallMargin, right: mediumMargin)
        )

        cardIcon.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            padding: UIEdgeInsets(top: mediumMargin, left: mediumMargin, bottom: .zero, right: .zero),
            size: CGSize(width: 40, height: 40)
        )
    }
}
