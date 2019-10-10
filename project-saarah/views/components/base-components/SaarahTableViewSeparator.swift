//
//  SaarahTableViewSeparator.swift
//  project-saarah
//
//  Created by Bruno Rocha on 29/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahTableViewSeparator: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func customize() {
        translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 1).isActive = true
        backgroundColor = AppStyleGuide.Colors.lightGray.uiColor
    }
}
