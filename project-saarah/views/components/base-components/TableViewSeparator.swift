//
//  TableViewSeparator.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class TableViewSeparator: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func customize() {
        frame.size = CGSize(width: frame.size.width, height: 1)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = AppStyleGuide.Colors.lightGray.uiColor
    }
}
