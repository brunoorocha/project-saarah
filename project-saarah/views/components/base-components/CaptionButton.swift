//
//  CaptionButton.swift
//  project-saarah
//
//  Created by Bruno Rocha on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class CaptionButton: SaarahButton {
    override func customize() {
        titleLabel?.font = AppStyleGuide.Typography.captionBold.uiFont
        setTitleColor(AppStyleGuide.Colors.primary.uiColor, for: .normal)
        heightAnchor.constraint(equalToConstant: 16.5).isActive = true
        backgroundColor = .none
    }
}
