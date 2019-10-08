//
//  SaarahLabel.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultLabelConfiguration()
        customize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func defaultLabelConfiguration () {
        translatesAutoresizingMaskIntoConstraints = false
        sizeToFit()
        numberOfLines = 0
    }

    func customize() {}
}
