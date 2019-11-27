//
//  SaarahView.swift
//  project-saarah
//
//  Created by Thiago Valente on 19/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func customize() {
        backgroundColor = AppStyleGuide.Colors.foreground.uiColor
        translatesAutoresizingMaskIntoConstraints = false

        let corners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.maskedCorners = corners
        layer.cornerRadius = AppStyleGuide.Sizes.cornerRadius.rawValue
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = AppStyleGuide.Colors.lightGray.uiColor.cgColor
    }
}
