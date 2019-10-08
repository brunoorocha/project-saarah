//
//  ButtonTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    private let componentBackgroundView = UIView(
        cornerRadius: 8.0,
        backgroundColor: .white
    )

    private let addIconImageView = UIImageView(
        name: "add-icon",
        cornerRadius: 8.0
    )

    private let buttonTitleLabel = UILabel(
        text: "Adicionar Mais Itens Nesse Produto",
        textAlignment: .center
    )

    override private init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear

        setupLayout()
    }

    private func setupLayout() {
        // Add subview to cell.
        contentView.addSubview(componentBackgroundView)

        // Add subviews to componentBackgroundView.
        componentBackgroundView.addSubviews([addIconImageView, buttonTitleLabel])

        // Constraints for componentBackgroundView.
        componentBackgroundView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 16.0)
        )

        // Constraint height for componentBackgroundView.
        componentBackgroundView.constraintHeight(56.0)

        // Contraints for addIconImageView.
        addIconImageView.anchor(
            top: componentBackgroundView.topAnchor,
            leading: componentBackgroundView.leadingAnchor,
            bottom: componentBackgroundView.bottomAnchor,
            padding: UIEdgeInsets(top: 20.0, left: 16.0, bottom: 20.0, right: 0.0)
        )

        // Constraint width for componentBackgroundView.
        addIconImageView.constraintWidth(addIconImageView.heightAnchor)

        // Constraints for buttonTitleLabel.
        buttonTitleLabel.anchor(
            top: componentBackgroundView.topAnchor,
            leading: addIconImageView.trailingAnchor,
            bottom: componentBackgroundView.bottomAnchor,
            trailing: componentBackgroundView.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 8.0, bottom: 16.0, right: 16.0)
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
