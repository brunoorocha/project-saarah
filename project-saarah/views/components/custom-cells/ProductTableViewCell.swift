//
//  ProductTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductTableViewCell: SaarahTableViewCell {
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
        // This defines the margin numbers for content elements.
        let smallMargin = AppStyleGuide.Margins.small.rawValue
        let mediumMargin = AppStyleGuide.Margins.medium.rawValue
        
        // Add subviews to cellContentView.
        cellContentView.addSubviews(
            [
                productNameLabel,
                productDetailsTextView,
                arrowIconImageView
            ]
        )

        // Constraints for cellContentView.
        cellContentView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(
                top: mediumMargin,
                left: mediumMargin,
                bottom: .zero,
                right: mediumMargin
            )
        )

        // Constraints for productNameLabel.
        productNameLabel.anchor(
            top: cellContentView.topAnchor,
            leading: cellContentView.leadingAnchor,
            bottom: cellContentView.bottomAnchor,
            trailing: productDetailsTextView.leadingAnchor,
            padding: UIEdgeInsets(
                top: mediumMargin,
                left: mediumMargin,
                bottom: mediumMargin,
                right: smallMargin
            )
        )

        // Constraints for productDetailsTextView.
        productDetailsTextView.anchor(
            top: cellContentView.topAnchor,
            bottom: cellContentView.bottomAnchor,
            trailing: arrowIconImageView.leadingAnchor,
            padding: UIEdgeInsets(
                top: mediumMargin,
                left: .zero,
                bottom: mediumMargin,
                right: 12.0
            )
        )
        
        // Constraint width for productDetailsTextView.
        productDetailsTextView.constraintWidth(96.0)

        // Constraints for arrowIconImageView.
        arrowIconImageView.anchor(
            top: cellContentView.topAnchor,
            bottom: cellContentView.bottomAnchor,
            trailing: cellContentView.trailingAnchor,
            padding: UIEdgeInsets(
                top: 20.0,
                left: .zero,
                bottom: 20.0,
                right: mediumMargin
            )
        )
        
        // Constraint width for arrowIconImageView.
        arrowIconImageView.constraintWidth(9.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
