//
//  UnderConstructionViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 21/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class UnderConstructionViewController: SaarahViewController {
    private var coneIcon = SaarahImageView(image: AppStyleGuide.Icons.cone.uiImage)
    private var titleLabel = Heading2Label()
    private var textLabel = ParagraphLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews () {
        view.addSubviews([titleLabel, textLabel, coneIcon])

        titleLabel.text = Localization(.underConstruction(.title)).description
        textLabel.text = Localization(.underConstruction(.paragraph)).description
        textLabel.textAlignment = .center

        let smallMargin = AppStyleGuide.Margins.small.rawValue
        let largeMargin = AppStyleGuide.Margins.large.rawValue

        NSLayoutConstraint.activate([
            coneIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -coneIcon.frame.height),
            coneIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            titleLabel.topAnchor.constraint(equalTo: coneIcon.bottomAnchor, constant: largeMargin),
            titleLabel.centerXAnchor.constraint(equalTo: coneIcon.centerXAnchor),

            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: smallMargin),
            textLabel.centerXAnchor.constraint(equalTo: coneIcon.centerXAnchor)
        ])
    }
}
