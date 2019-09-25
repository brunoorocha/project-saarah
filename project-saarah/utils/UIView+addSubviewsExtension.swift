//
//  UIView+addSubviewsExtension.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { subview in
            addSubview(subview)
        }
    }
}
