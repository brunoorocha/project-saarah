//
//  ProductItemTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductItemTableViewCell: UITableViewCell {
    private let componentBackgroundView = UIView(
        cornerRadius: 8.0,
        backgroundColor: .white
    )

    private let amountLabel = UILabel(text: "Quantidade")
    private let validityLabel = UILabel(text: "Validade")
    private let priceLabel = UILabel(text: "Valor")
    private let addedOnDayLabel = UILabel(text: "Adicionado no Dia")

    private let numericAmountLabel = UILabel(textColor: .subtitle, textAlignment: .right)
    private let numericValidityLabel = UILabel(textColor: .subtitle, textAlignment: .right)
    private let numericPriceLabel = UILabel(textColor: .subtitle, textAlignment: .right)
    private let numericAddedOnDayLabel = UILabel(textColor: .subtitle, textAlignment: .right)

    override private init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear

        setupLayout()
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

    private func setupLayout() {
        // Add subview to contentView.
        contentView.addSubview(componentBackgroundView)

        // Add subviews to componentBackgroundView.
        componentBackgroundView.addSubviews(
            [
                amountLabel,
                validityLabel,
                priceLabel,
                addedOnDayLabel,
                numericAmountLabel,
                numericValidityLabel,
                numericPriceLabel,
                numericAddedOnDayLabel
            ]
        )

        // Constraints for componentBackgroundView.
        componentBackgroundView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 16.0)
        )
        
        // Constraint height for componentBackgroundView.
        componentBackgroundView.constraintHeight(176.0)

        // Constraints for amountLabel.
        amountLabel.anchor(
            top: componentBackgroundView.topAnchor,
            leading: componentBackgroundView.leadingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 136.0, height: 24.0)
        )

        // Constraints for validityLabel.
        validityLabel.anchor(
            top: amountLabel.bottomAnchor,
            leading: componentBackgroundView.leadingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 136.0, height: 24.0)
        )

        // Constraints for valueLabel.
        priceLabel.anchor(
            top: validityLabel.bottomAnchor,
            leading: componentBackgroundView.leadingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 136.0, height: 24.0)
        )

        // Constraints for addedOnDayLabel.
        addedOnDayLabel.anchor(
            top: priceLabel.bottomAnchor,
            leading: componentBackgroundView.leadingAnchor,
            bottom: componentBackgroundView.bottomAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 0.0)
        )
        
        // Constraint height for addedOnDayLabel.
        addedOnDayLabel.constraintWidth(136.0)

        // Constraints for numericAmountLabel.
        numericAmountLabel.anchor(
            top: componentBackgroundView.topAnchor,
            trailing: componentBackgroundView.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 0.0, bottom: 0.0, right: 16.0),
            size: CGSize(width: 88.0, height: 24.0)
        )

        // Constraints for numericValidityLabel.
        numericValidityLabel.anchor(
            top: numericAmountLabel.bottomAnchor,
            trailing: componentBackgroundView.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 0.0, bottom: 0.0, right: 16.0),
            size: CGSize(width: 88.0, height: 24.0)
        )

        // Constraint for numericValueLabel.
        numericPriceLabel.anchor(
            top: numericValidityLabel.bottomAnchor,
            trailing: componentBackgroundView.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 0.0, bottom: 0.0, right: 16.0),
            size: CGSize(width: 88.0, height: 24.0)
        )

        // Constraints for numericAddedOnDayLabel.
        numericAddedOnDayLabel.anchor(
            top: numericPriceLabel.bottomAnchor,
            bottom: componentBackgroundView.bottomAnchor,
            trailing: componentBackgroundView.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 0.0, bottom: 16.0, right: 16.0)
        )
        
        // Constraint height for numericAddedOnDayLabel.
        numericAddedOnDayLabel.constraintWidth(88.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
