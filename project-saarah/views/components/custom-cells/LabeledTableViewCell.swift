//
//  LabeledTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class LabeledTableViewCell: SaarahTableViewCell {
    private let productLabel = UILabel(text: "Produto")
    private let productNameLabel = UILabel(textColor: .subtitle)

    override private init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear

        setupLayout()
    }

	public func setContent(title: String, subtitle: String) {
		productLabel.text = title
		productNameLabel.text = subtitle
	}

    public func setupProductNameLabelWith(_ productName: String) {
        productNameLabel.text = productName
    }

    private func setupLayout() {
        // Add subviews to cellContentView.
        cellContentView.addSubviews(
            [
                productLabel,
                productNameLabel
            ]
        )

        // Constraints for cellContentView.
        cellContentView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        )

        // Constraints for productLabel.
        productLabel.anchor(
            top: cellContentView.topAnchor,
            leading: cellContentView.leadingAnchor,
            bottom: cellContentView.centerYAnchor,
            trailing: cellContentView.trailingAnchor,
            padding: UIEdgeInsets(top: 8.0, left: 16.0, bottom: 4.0, right: 16.0)
        )

        // Contraints for productNameLabel.
        productNameLabel.anchor(
            top: cellContentView.centerYAnchor,
            leading: cellContentView.leadingAnchor,
            bottom: cellContentView.bottomAnchor,
            trailing: cellContentView.trailingAnchor,
            padding: UIEdgeInsets(top: 4.0, left: 16.0, bottom: 8.0, right: 16.0)
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
