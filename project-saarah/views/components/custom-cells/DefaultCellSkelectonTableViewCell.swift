//
//  DefaultCellSkelectonTableViewCell.swift
//  project-saarah
//
//  Created by Bruno Rocha on 23/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class DefaultCellSkelectonTableViewCell: SaarahTableViewCell {
    override func configureCellComponents() {
        isUserInteractionEnabled = false
        let labelSkelectonView1 = SkelectonLoadingView(size: CGSize(width: 0, height: 16))
        let labelSkelectonView2 = SkelectonLoadingView(size: CGSize(width: 32, height: 16))
        let separator = SaarahTableViewSeparator()
        cellContentView.addSubviews([labelSkelectonView1, labelSkelectonView2, separator])

        let mediumMargin = AppStyleGuide.Margins.medium.rawValue
        let largeMargin = AppStyleGuide.Margins.large.rawValue

        NSLayoutConstraint.activate([
            labelSkelectonView1.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: mediumMargin),
            labelSkelectonView1.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: mediumMargin),
            labelSkelectonView1.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -mediumMargin),
            labelSkelectonView1.widthAnchor.constraint(equalTo: cellContentView.widthAnchor, multiplier: 0.6),

            labelSkelectonView2.topAnchor.constraint(equalTo: labelSkelectonView1.topAnchor),
            labelSkelectonView2.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -largeMargin),

            separator.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: mediumMargin),
            separator.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor)
        ])
    }
}
