//
//  OnboardingCollectionViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 08/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    public var onboardingDataModel: OnboardingDataModel? {
        didSet {
            guard let unwrappedDataModel = onboardingDataModel else { return }

            mainImageView.image = unwrappedDataModel.image
            mainDescriptionLabel.text = unwrappedDataModel.description
        }
    }

    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private let mainDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppStyleGuide.Colors.textColor.uiColor
        label.font = AppStyleGuide.Typography.heading3.uiFont
        label.numberOfLines = 0

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }

    private func setupLayout() {
        // Add subviews to cell.
        addSubviews([mainImageView, mainDescriptionLabel])

        // Constraints for mainImageView.
        mainImageView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 64.0, left: 12.0, bottom: 0.0, right: 12.0),
            size: .init(width: 351.0, height: 416.0)
        )

        // Constraints for mainDescriptionLabel.
        mainDescriptionLabel.anchor(
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            padding: UIEdgeInsets(top: 0.0, left: 24.0, bottom: 80.0, right: 24.0)
        )

        // Constraint height for mainDescriptionLabel.
        mainDescriptionLabel.constraintHeight(64.0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
}
