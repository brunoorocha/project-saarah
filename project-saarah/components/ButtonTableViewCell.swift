//
//  ButtonTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    private let componentBackgroundView = UIView(cornerRadius: 8.0, backgroundColor: .white)

    private let addIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "add-icon")
        imageView.contentMode = .scaleAspectFill

        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8.0

        return imageView
    }()

    private let buttonTitleLabel = UILabel(text: "\(Localization(.buttonTableViewCell(.title)))", textAlignment: .center)

    override private init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = .clear

        setupLayout()
    }

    private func setupLayout() {
        // Add subview to cell.
        self.addSubview(componentBackgroundView)

        // Add subviews to componentBackgroundView.
        componentBackgroundView.addSubviews([addIconImageView, buttonTitleLabel])

        // Constraints for componentBackgroundView.
        componentBackgroundView.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 343.0, height: 56.0)
        )

        // Contraints for addIconImageView.
        addIconImageView.anchor(
            top: componentBackgroundView.topAnchor,
            leading: componentBackgroundView.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20.0, left: 20.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 16.0, height: 16.0)
        )

        // Constraints for buttonTitleLabel.
        buttonTitleLabel.anchor(
            top: componentBackgroundView.topAnchor,
            leading: addIconImageView.trailingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 8.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 287.0 , height: 24.0)
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
