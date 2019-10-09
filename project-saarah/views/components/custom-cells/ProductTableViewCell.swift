//
//  ProductTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    private let componentBackgroundView = UIView(
        cornerRadius: 8.0,
        backgroundColor: .white
    )

    private let productNameLabel = UILabel(textColor: .buttonTitle)

    private let productAmountLabel: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(
            string: "40",
            attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16.0),
                NSAttributedString.Key.foregroundColor: UIColor.black
            ]
        )

        attributedText.append(
            NSAttributedString(
                string: " / 5 (kg)",
                attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0),
                    NSAttributedString.Key.foregroundColor: UIColor.lightGray
                ]
            )
        )

        textView.attributedText = attributedText
        textView.textAlignment = .right

        textView.textContainerInset = UIEdgeInsets(top: 2.0, left: 0.0, bottom: 0.0, right: 0.0)

        textView.isEditable = false
        textView.isScrollEnabled = false

        // This enables autolayout for textView.
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
    
    private let arrowIconImageView = UIImageView(name: "arrow-icon")

    override private init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear

        setupLayout()
    }
    
    public func setupProductNameLabelWith(_ productName: String) {
        productNameLabel.text = productName
    }

    private func setupLayout() {
        // Add subview to contentView.
        contentView.addSubview(componentBackgroundView)

        // Add subviews to componentBackgroundView.
        componentBackgroundView.addSubviews(
            [
                productNameLabel,
                productAmountLabel,
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
            trailing: productAmountLabel.leadingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 8.0)
        )

        // Constraints for productAmountLabel.
        productAmountLabel.anchor(
            top: componentBackgroundView.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: arrowIconImageView.leadingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 0.0, bottom: 0.0, right: 8.0),
            size: CGSize(width: 96.0, height: 24.0)
        )

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
