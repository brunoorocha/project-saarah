//
//  SaarahTextField.swift
//  project-saarah
//
//  Created by Bruno Rocha on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func customize() {
        translatesAutoresizingMaskIntoConstraints = false
        font = AppStyleGuide.Typography.paragraph.uiFont
        textColor = AppStyleGuide.Colors.textColor.uiColor
    }
}
