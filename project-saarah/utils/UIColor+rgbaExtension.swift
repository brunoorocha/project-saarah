//
//  UIColor+rgbaExtension.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: (red / 255.0), green: (green / 255.0), blue: (blue / 255.0), alpha: alpha)
    }
}
