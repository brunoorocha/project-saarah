//
//  FieldErrorLabel.swift
//  project-saarah
//
//  Created by Bruno Rocha on 19/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class FieldErrorLabel: SaarahLabel {
    override func customize() {
        font = AppStyleGuide.Typography.caption.uiFont
        textColor = AppStyleGuide.Colors.red.uiColor
    }
}
