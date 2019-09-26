//
//  SaarahButton.swift
//  project-saarah
//
//  Created by Bruno Rocha on 26/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultConfiguration()
        customize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func defaultConfiguration () {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func customize() {}
}
