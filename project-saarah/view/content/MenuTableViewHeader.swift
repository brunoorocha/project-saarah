//
//  MenuTableViewHeader.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 09/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class MenuTableViewHeader: UIView {
    private let classifierImageName: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red

        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8.0

        // This enables autolayout to imageView.
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private let classifierName: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red

        label.layer.masksToBounds = true
        label.layer.cornerRadius = 4.0

        // This enables autolayout to label.
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .green

        setupLayout()
    }

    private func setupLayout() {
        // This is a auxiliar view for the main content.
        let contentView: UIView = {
            let view = UIView()
            view.backgroundColor = .blue

            view.layer.masksToBounds = true
            view.layer.cornerRadius = 8.0

            // This enables autolayout to view.
            view.translatesAutoresizingMaskIntoConstraints = false

            return view
        }()

        // Add subviews to class.
        addSubviews([contentView, classifierImageName])

        // Add subview to contentView.
        contentView.addSubview(classifierName)

        // Contraints for contentView, classifierImageName, classifierName.
        NSLayoutConstraint.activate(
            [
                contentView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
                contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0),
                contentView.leadingAnchor.constraint(equalTo: classifierImageName.leadingAnchor, constant: 20.0),
                contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),

                classifierImageName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4.0),
                classifierImageName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4.0),
                classifierImageName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
                classifierImageName.widthAnchor.constraint(equalToConstant: 40.0),

                classifierName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
                classifierName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
                classifierName.leadingAnchor.constraint(equalTo: classifierImageName.trailingAnchor, constant: 8.0),
                classifierName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0)
            ]
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
