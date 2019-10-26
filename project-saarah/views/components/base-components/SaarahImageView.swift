//
//  SaarahImage.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        defaultImageConfiguration()
        customize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultImageConfiguration()
        customize()
    }

    override init(image: UIImage?) {
        super.init(image: image)
        defaultImageConfiguration()
        customize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func defaultImageConfiguration () {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        contentMode = .scaleAspectFill
        tintColor = AppStyleGuide.Colors.primary.uiColor
    }

    func customize () {}
}
