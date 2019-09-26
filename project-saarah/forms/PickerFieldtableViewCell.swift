//
//  PickerFieldtableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class PickerFieldTableViewCell: UITableViewCell {
    private let formBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        view.layer.cornerRadius = 8.0

        return view
    }()

    private let measurementUnitLabel = UILabel(text: "Unidade de Medida")
    private let measureUnitTypesLabel = UILabel(text: "Unidades, Quilos, Gramas...", textColor: .lightGray)

    private let arrowIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "arrow-icon")
        imageView.contentMode = .scaleAspectFill

        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8.0

        return imageView
    }()

    override private init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear

        setupLayout()
    }

    private func setupLayout() {
        // Add subview to cell.
        self.addSubview(formBackgroundView)

        // Add subviews to formBackgroundView.
        formBackgroundView.addSubviews([measurementUnitLabel, measureUnitTypesLabel, arrowIconImageView])

        // Constraints for formBackgroundView.
        formBackgroundView.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 343.0, height: 88.0)
        )

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
            leading: nil,
            bottom: nil,
            trailing: formBackgroundView.trailingAnchor,
            padding: UIEdgeInsets(top: 36.0, left: 0.0, bottom: 0.0, right: 16.0),
            size: CGSize(width: 8.0, height: 16.0)
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
