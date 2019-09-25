//
//  SaarahImage.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }

    override init(image: UIImage?) {
        super.init(image: image)
        customize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func customize() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = AppStyleGuide.Colors.background.uiColor
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
}
