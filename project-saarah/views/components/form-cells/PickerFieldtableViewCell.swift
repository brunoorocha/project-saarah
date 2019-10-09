//
//  PickerFieldtableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class PickerFieldTableViewCell: UITableViewCell {
    private let formBackgroundView = UIView(backgroundColor: .white)

    private let measurementUnitLabel = UILabel(text: "Unidade de Medida", textColor: .buttonTitle)
    private let measureUnitTypesLabel = UILabel(text: "Unidades, Quilos, Gramas...", textColor: .subtitle)

    private let arrowIconImageView = UIImageView(name: "arrow-icon")

    override private init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear

        setupLayout()
    }

    private func setupLayout() {
        // Add subview to contentView.
        contentView.addSubview(formBackgroundView)

        // Add subviews to formBackgroundView.
        formBackgroundView.addSubviews(
            [
                measurementUnitLabel,
                measureUnitTypesLabel,
                arrowIconImageView
            ]
        )

        // Constraints for formBackgroundView.
        formBackgroundView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 16.0)
        )
        
        // Constraint height for formBackgroundView.
        formBackgroundView.constraintHeight(88.0)

        // Constraints for measurementUnitLabel.
        measurementUnitLabel.anchor(
            top: formBackgroundView.topAnchor,
            leading: formBackgroundView.leadingAnchor,
            bottom: formBackgroundView.centerYAnchor,
            trailing: arrowIconImageView.leadingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 4.0, right: 8.0)
        )

        // Constraints for measureUnitTypesLabel.
        measureUnitTypesLabel.anchor(
            top: formBackgroundView.centerYAnchor,
            leading: formBackgroundView.leadingAnchor,
            bottom: formBackgroundView.bottomAnchor,
            trailing: arrowIconImageView.leadingAnchor,
            padding: UIEdgeInsets(top: 4.0, left: 16.0, bottom: 16.0, right: 8.0)
        )

        // Constraints for arrowIconImageView.
        arrowIconImageView.anchor(
            top: formBackgroundView.topAnchor,
            bottom: formBackgroundView.bottomAnchor,
            trailing: formBackgroundView.trailingAnchor,
            padding: UIEdgeInsets(top: 36.0, left: 0.0, bottom: 36.0, right: 16.0)
        )
        
        // Constraint width for arrowIconImageView.
        arrowIconImageView.constraintWidth(9.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
