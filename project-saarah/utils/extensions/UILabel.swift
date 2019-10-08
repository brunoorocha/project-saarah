//
//  UILabel.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UILabel {
    convenience public init(
        text: String = "",
        textColor: UIColor = .title,
        fontSize: CGFloat = 16.0,
        textAlignment: NSTextAlignment = .natural
    ) {
        self.init(frame: .zero)

        self.text = text
        self.textColor = textColor
        self.font = UIFont.boldSystemFont(ofSize: fontSize)
        self.textAlignment = textAlignment

        self.backgroundColor = .clear
    }
}
