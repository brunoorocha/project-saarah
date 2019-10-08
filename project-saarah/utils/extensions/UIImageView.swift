//
//  UIImageView.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 08/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience public init(
        name: String = "",
        cornerRadius: CGFloat = 0.0
    ) {
        self.init(frame: .zero)
        self.backgroundColor = .clear

        self.image = UIImage(named: name)

        // The content is confined to the bounds of the class UIImageView.
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill

        // This enables cornerRadius to bounds of the class UIImageView.
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
