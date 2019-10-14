//
//  LabeledTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class LabeledTableViewCell: UITableViewCell {
    private let componentBackgroundView = UIView(cornerRadius: 8.0, backgroundColor: .white)

    private let productLabel = UILabel(text: "\(Localization(.labeledTableViewCell(.productLabel)))")

    private let productNameLabel = UILabel(textColor: .lightGray)

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
        // Add subview to cell.
        self.addSubview(componentBackgroundView)

        // Add subviews to componentBackgroundView.
        componentBackgroundView.addSubviews([productLabel, productNameLabel])

        // Constraints for componentBackgroundView.
        componentBackgroundView.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 343.0, height: 88.0)
        )

        // Constraints for productLabel.
        productLabel.anchor(
            top: componentBackgroundView.topAnchor,
            leading: componentBackgroundView.leadingAnchor,
            bottom: componentBackgroundView.centerYAnchor,
            trailing: componentBackgroundView.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 4.0, right: 16.0)
        )

        // Contraints for productNameLabel.
        productNameLabel.anchor(
            top: componentBackgroundView.centerYAnchor,
            leading: componentBackgroundView.leadingAnchor,
            bottom: componentBackgroundView.bottomAnchor,
            trailing: componentBackgroundView.trailingAnchor,
            padding: UIEdgeInsets(top: 4.0, left: 16.0, bottom: 16.0, right: 16.0)
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
