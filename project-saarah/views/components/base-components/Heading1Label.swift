//
//  Heading1Label.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class Heading1Label: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func customize() {
        font = AppStyleGuide.Typography.heading1.uiFont
        textColor = AppStyleGuide.Colors.textColor.uiColor
    }
}
