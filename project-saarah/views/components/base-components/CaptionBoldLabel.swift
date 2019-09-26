//
//  CaptionBoldLabel.swift
//  project-saarah
//
//  Created by Bruno Rocha on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class CaptionBoldLabel: SaarahLabel {
    override func customize() {
        font = AppStyleGuide.Typography.captionBold.uiFont
        textColor = AppStyleGuide.Colors.mediumGray.uiColor
    }
}
