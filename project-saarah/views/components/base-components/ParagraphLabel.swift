//
//  ParagraphLabel.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ParagraphLabel: SaarahLabel {
    override func customize() {
        font = AppStyleGuide.Typography.paragraph.uiFont
        textColor = AppStyleGuide.Colors.textColor.uiColor
    }
}
