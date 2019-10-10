//
//  Heading2Label.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class Heading2Label: SaarahLabel {
    override func customize() {
        font = AppStyleGuide.Typography.heading2.uiFont
        textColor = AppStyleGuide.Colors.textColor.uiColor
    }
}
