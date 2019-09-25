//
//  UILabel.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UILabel {
    convenience public init(text: String, textColor: UIColor = .black) {
        self.init(frame: .zero)
        
        self.text = text
        self.textColor = textColor
        self.font = UIFont.boldSystemFont(ofSize: 16.0)
        self.textAlignment = .natural
        
        self.backgroundColor = .clear
    }
}
