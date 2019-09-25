//
//  CaptionLabel.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class CaptionLabel: SaarahLabel {
    override func customize() {
        font = AppStyleGuide.Typography.caption.uiFont
        textColor = AppStyleGuide.Colors.mediumGray.uiColor
    }
}
