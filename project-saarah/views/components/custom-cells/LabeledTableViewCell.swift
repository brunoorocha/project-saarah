//
//  LabeledTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class LabeledTableViewCell: SaarahTableViewCell {
    private let productLabel = UILabel()
    private let productNameLabel = UILabel(textColor: .subtitle)
    
    private let separatorView = UIView(backgroundColor: .separator)

    override private init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear

        setupLayout()
    }

	public func setContent(title: String, subtitle: String) {
		productLabel.text = title
		productNameLabel.text = subtitle
	}

    private func setupLayout() {
        // This defines the margin numbers for content elements.
        let xSmallMargin = AppStyleGuide.Margins.xsmall.rawValue
        let smallMargin = AppStyleGuide.Margins.small.rawValue
        let mediumMargin = AppStyleGuide.Margins.medium.rawValue
        
        // Add subviews to cellContentView.
        cellContentView.addSubviews(
            [
                productLabel,
                productNameLabel,
                separatorView
            ]
        )

        // Constraints for cellContentView.
        cellContentView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(
                top: .zero,
                left: mediumMargin,
                bottom: .zero,
                right: mediumMargin
            )
        )

        // Constraints for productLabel.
        productLabel.anchor(
            top: cellContentView.topAnchor,
            leading: cellContentView.leadingAnchor,
            bottom: cellContentView.centerYAnchor,
            trailing: cellContentView.trailingAnchor,
            padding: UIEdgeInsets(
                top: smallMargin,
                left: mediumMargin,
                bottom: xSmallMargin,
                right: mediumMargin
            )
        )

        // Contraints for productNameLabel.
        productNameLabel.anchor(
            top: cellContentView.centerYAnchor,
            leading: cellContentView.leadingAnchor,
            bottom: cellContentView.bottomAnchor,
            trailing: cellContentView.trailingAnchor,
            padding: UIEdgeInsets(
                top: xSmallMargin,
                left: mediumMargin,
                bottom: smallMargin,
                right: mediumMargin
            )
        )
        
        // Constraints for separatorView.
        separatorView.anchor(
            leading: productNameLabel.leadingAnchor,
            bottom: cellContentView.bottomAnchor,
            trailing: cellContentView.trailingAnchor
        )
        
        // Constraint height for separatorView.
        separatorView.constraintHeight(1.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
