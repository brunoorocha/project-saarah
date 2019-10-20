//
//  ProductItemTableViewCell.swift
//  project-saarah
//
//  Created by Thiago Valente on 20/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductItemTableViewCell: SaarahTableViewCell {

    var amountLabel = SaarahLabel()
    var validityLabel = SaarahLabel()
    var priceLabel = SaarahLabel()
    var addedOnDayLabel = SaarahLabel()

    var numericAmountLabel = ParagraphLabel()
    var numericValidityLabel = ParagraphLabel()
    var numericPriceLabel = ParagraphLabel()
    var numericAddedOnDayLabel = ParagraphLabel()

    let xSmallMargin = AppStyleGuide.Margins.xsmall.rawValue
    let smallMargin = AppStyleGuide.Margins.small.rawValue
    let mediumMargin = AppStyleGuide.Margins.medium.rawValue

    var subViewConstraints: [NSLayoutConstraint] = []

    override func configureCellComponents() {
        cellContentView.addSubviews([amountLabel, validityLabel, priceLabel, addedOnDayLabel,
            numericAmountLabel, numericValidityLabel,
            numericPriceLabel, numericAddedOnDayLabel])

        // MARK: Configure constraints to view
        NSLayoutConstraint.activate([
            cellContentView.heightAnchor.constraint(equalToConstant: 170),
            cellContentView.topAnchor.constraint(equalTo: topAnchor, constant: smallMargin),
            cellContentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -smallMargin)
        ])

        // MARK: Setup rounded
        let corners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner]
        cellContentView.layer.maskedCorners = corners
        cellContentView.layer.cornerRadius = AppStyleGuide.Sizes.cornerRadius.rawValue
        cellContentView.layer.masksToBounds = true

        // MARK: Configure titles to labels
        amountLabel.text = "\(Localization(.productItemTableViewCell(.amountLabel)))"
        validityLabel.text =  "\(Localization(.productItemTableViewCell(.validityLabel)))"
        priceLabel.text = "\(Localization(.productItemTableViewCell(.priceLabel)))"
        addedOnDayLabel.text = "\(Localization(.productItemTableViewCell(.addedOnDayLabel)))"

        // MARK: Configure constraints to components
        numericAmountLabel.textAlignment = .right
        numericValidityLabel.textAlignment = .right
        numericPriceLabel.textAlignment = .right
        numericAddedOnDayLabel.textAlignment = .right

        setupConstraints(withLeftLabel: amountLabel, andRightLabel: numericAmountLabel, andTopView: nil)
        setupConstraints(withLeftLabel: validityLabel, andRightLabel: numericValidityLabel, andTopView: amountLabel)
        setupConstraints(withLeftLabel: priceLabel, andRightLabel: numericPriceLabel, andTopView: validityLabel)
        setupConstraints(withLeftLabel: addedOnDayLabel, andRightLabel: numericAddedOnDayLabel, andTopView: priceLabel)
        NSLayoutConstraint.activate(subViewConstraints)
    }

    private func setupConstraints(withLeftLabel leftLabel: UILabel, andRightLabel rightLabel: UILabel, andTopView topView: UIView?) {
        if let topView = topView {
            subViewConstraints.append(leftLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: mediumMargin))
            subViewConstraints.append(rightLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: mediumMargin))
        } else {
            subViewConstraints.append(leftLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: mediumMargin))
            subViewConstraints.append(rightLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: mediumMargin))
        }
        subViewConstraints.append(leftLabel.leftAnchor.constraint(equalTo: cellContentView.leftAnchor, constant: mediumMargin))
        subViewConstraints.append(rightLabel.leftAnchor.constraint(equalTo: leftLabel.leftAnchor, constant: xSmallMargin))
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
