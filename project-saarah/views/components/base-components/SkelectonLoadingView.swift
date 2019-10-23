//
//  SkelectonLoadingView.swift
//  project-saarah
//
//  Created by Bruno Rocha on 23/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SkelectonLoadingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = AppStyleGuide.Colors.lightGray.uiColor
        heightAnchor.constraint(equalToConstant: frame.height).isActive = true
    }

    convenience init(size: CGSize) {
        self.init(frame: CGRect(origin: .zero, size: size))
        if (size.width != 0) {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
