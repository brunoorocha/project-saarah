//
//  ProductItemTableViewCell.swift
//  project-saarah
//
//  Created by Thiago Valente on 20/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductItemTableViewCell: SaarahTableViewCell {

    var amountLabel = ParagraphLabel()
    var validityLabel = ParagraphLabel()
    var priceLabel = ParagraphLabel()
    var addedOnDayLabel = ParagraphLabel()

    var numericAmountLabel = ParagraphLabel()
    var numericValidityLabel = ParagraphLabel()
    var numericPriceLabel = ParagraphLabel()
    var numericAddedOnDayLabel = ParagraphLabel()

    let xSmallMargin = AppStyleGuide.Margins.xsmall.rawValue
    let smallMargin = AppStyleGuide.Margins.small.rawValue
    let mediumMargin = AppStyleGuide.Margins.medium.rawValue

    override var insets: UIEdgeInsets {
        return UIEdgeInsets(top: AppStyleGuide.Margins.medium.rawValue,
                            left: AppStyleGuide.Margins.medium.rawValue,
                            bottom: 0,
                            right: AppStyleGuide.Margins.medium.rawValue)
    }

    var subViewConstraints: [NSLayoutConstraint] = []

    override func configureCellComponents() {
        cellContentView.addSubviews([amountLabel, validityLabel, priceLabel, addedOnDayLabel,
            numericAmountLabel, numericValidityLabel,
            numericPriceLabel, numericAddedOnDayLabel])

        // MARK: Setup rounded
        let corners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner]
        cellContentView.layer.maskedCorners = corners
        cellContentView.layer.cornerRadius = AppStyleGuide.Sizes.cornerRadius.rawValue
        cellContentView.layer.masksToBounds = true

        // MARK: Configure titles to labels
        amountLabel.text = Localization(.productItemTableViewCell(.label(.amount))).description
        validityLabel.text = Localization(.productItemTableViewCell(.label(.validity))).description
        priceLabel.text = Localization(.productItemTableViewCell(.label(.price))).description
        addedOnDayLabel.text = Localization(.productItemTableViewCell(.label(.addedOnDay))).description

        // MARK: Configure constraints to components
        numericAmountLabel.textAlignment = .right
        numericValidityLabel.textAlignment = .right
        numericPriceLabel.textAlignment = .right
        numericAddedOnDayLabel.textAlignment = .right

        numericAmountLabel.textColor = AppStyleGuide.Colors.mediumGray.uiColor
        numericValidityLabel.textColor = AppStyleGuide.Colors.mediumGray.uiColor
        numericPriceLabel.textColor = AppStyleGuide.Colors.mediumGray.uiColor
        numericAddedOnDayLabel.textColor = AppStyleGuide.Colors.mediumGray.uiColor

        subViewConstraints.append(amountLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: mediumMargin))
        subViewConstraints.append(numericAmountLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: mediumMargin))
        setupConstraints(withLeftLabel: amountLabel, andRightLabel: numericAmountLabel, andTopView: nil)
        setupConstraints(withLeftLabel: validityLabel, andRightLabel: numericValidityLabel, andTopView: amountLabel)
        setupConstraints(withLeftLabel: priceLabel, andRightLabel: numericPriceLabel, andTopView: validityLabel)
        setupConstraints(withLeftLabel: addedOnDayLabel, andRightLabel: numericAddedOnDayLabel, andTopView: priceLabel)
        subViewConstraints.append(addedOnDayLabel.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -mediumMargin))
        subViewConstraints.append(numericAddedOnDayLabel.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -mediumMargin))
        NSLayoutConstraint.activate(subViewConstraints)
    }

    private func setupConstraints(withLeftLabel leftLabel: UILabel, andRightLabel rightLabel: UILabel, andTopView topView: UIView?) {
        if let topView = topView {
            subViewConstraints.append(leftLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: mediumMargin))
            subViewConstraints.append(rightLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: mediumMargin))
        }
        subViewConstraints.append(leftLabel.leftAnchor.constraint(equalTo: cellContentView.leftAnchor, constant: mediumMargin))
        subViewConstraints.append(rightLabel.leftAnchor.constraint(equalTo: leftLabel.rightAnchor, constant: xSmallMargin))
        subViewConstraints.append(rightLabel.rightAnchor.constraint(equalTo: cellContentView.rightAnchor, constant: -mediumMargin))
    }

    public func setupNumericLabelsWith(
        amountText: String,
        validityText: String,
        priceText: String,
        addedOnDayText: String
    ) {
        numericAmountLabel.text = amountText
        numericValidityLabel.text = validityText
        numericPriceLabel.text = priceText
        numericAddedOnDayLabel.text = addedOnDayText
    }

}
