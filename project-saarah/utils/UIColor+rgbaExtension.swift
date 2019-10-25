//
//  UIColor+rgbaExtension.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UIColor {
    // Colors for setup the background color of the main project.
    static var lightBackground = rgba(240, 240, 240)
    static var darkBackground = rgba(56, 56, 56)
    
    // Colors for setup the foreground color of the main project.
    static var lightForeground = UIColor.white
    static var darkForeground = rgba(72, 72, 72)
    
    // Colors for setup the text color of the main project.
    static var lightTextColor = rgba(56, 56, 56)
    static var darkTextColor = rgba(240, 240, 240)
    
    static func setupColorFor(_ lightMode: UIColor, _ darkMode: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor.init { (trait) -> UIColor in
                return trait.userInterfaceStyle == .dark ? darkMode : lightMode
            }
        } else {
            return lightMode
        }
    }

    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: (red / 255.0), green: (green / 255.0), blue: (blue / 255.0), alpha: alpha)
    }
}
