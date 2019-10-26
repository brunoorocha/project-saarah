//
//  UIColor+rgbaExtension.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UIColor {
    //Colors for setup the primary color of the main project.
    static let lightModePrimary = rgba(88, 72, 160)
    static let darkModePrimary = rgba(200, 192, 248)

    // Colors for setup the background color of the main project.
    static let lightModeBackground = rgba(240, 240, 240)
    static let darkModeBackground = UIColor.black

    // Colors for setup the foreground color of the main project.
    static let lightModeForeground = UIColor.white
    static let darkModeForeground = rgba(48, 48, 48)

    // Colors for setup the text color of the main project.
    static let lightModeTextColor = rgba(56, 56, 56)
    static let darkModeTextColor = UIColor.white

    // Colors for setup the lightGray color of the main project.
    static let lightModeLightGray = rgba(248, 248, 248)
    static let darkModeLightGray = rgba(72, 72, 72)

    static func setupColorFor(_ lightMode: UIColor, _ darkMode: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor.init { (trait) -> UIColor in
                let isDarkMode = trait.userInterfaceStyle

                if isDarkMode == .dark {
                    return darkMode
                } else {
                    return lightMode
                }
            }
        } else {
            return lightMode
        }
    }

    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: (red / 255.0), green: (green / 255.0), blue: (blue / 255.0), alpha: alpha)
    }
}
