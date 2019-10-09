//
//  ProductTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    private let componentBackgroundView = UIView(backgroundColor: .white)

    private let productNameLabel = UILabel(textColor: .buttonTitle)
    
    private let productDetailsTextView = UITextView()
    
    private let arrowIconImageView = UIImageView(name: "arrow-icon")

    override private init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear

        setupLayout()
    }
    
    public func setupProductNameAndDetailsWith(
        productName: String,
        numberInStock: Int,
        numberOfProductItem: Int,
        measurementUnit: String
    ) {
        productNameLabel.text = productName
        productDetailsTextView.setupProductDetailsWith(
            numberInStock: numberInStock,
            numberOfProductItem: numberOfProductItem,
            measurementUnit: measurementUnit)
    }

    private func setupLayout() {
        // Add subview to contentView.
        contentView.addSubview(componentBackgroundView)

        // Add subviews to componentBackgroundView.
        componentBackgroundView.addSubviews(
            [
                productNameLabel,
                productDetailsTextView,
                arrowIconImageView
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
        componentBackgroundView.constraintHeight(56.0)

        // Constraints for productNameLabel.
        productNameLabel.anchor(
            top: componentBackgroundView.topAnchor,
            leading: componentBackgroundView.leadingAnchor,
            bottom: componentBackgroundView.bottomAnchor,
            trailing: productDetailsTextView.leadingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 8.0)
        )

        // Constraints for productDetailsTextView.
        productDetailsTextView.anchor(
            top: componentBackgroundView.topAnchor,
            bottom: componentBackgroundView.bottomAnchor,
            trailing: arrowIconImageView.leadingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 0.0, bottom: 16.0, right: 12.0)
        )
        
        // Constraint width for productDetailsTextView.
        productDetailsTextView.constraintWidth(96.0)

        // Constraints for arrowIconImageView.
        arrowIconImageView.anchor(
            top: componentBackgroundView.topAnchor,
            bottom: componentBackgroundView.bottomAnchor,
            trailing: componentBackgroundView.trailingAnchor,
            padding: UIEdgeInsets(top: 20.0, left: 0.0, bottom: 20.0, right: 16.0)
        )
        
        // Constraint width for arrowIconImageView.
        arrowIconImageView.constraintWidth(9.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
