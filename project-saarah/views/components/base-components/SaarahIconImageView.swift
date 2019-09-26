//
//  SaarahIconImageView.swift
//  project-saarah
//
//  Created by Bruno Rocha on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahIconImageView: SaarahImageView {
    override func customize() {
        super.customize()
        widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        heightAnchor.constraint(equalToConstant: 24.0).isActive = true
    }
}
