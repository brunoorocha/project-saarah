//
//  UIColor.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 08/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UIColor {
    public static var title = UIColor.colorCode(56, 56, 56)
    public static var subtitle = UIColor.colorCode(168, 168, 168)
    public static var buttonTitle = UIColor.colorCode(88, 72, 160)
    public static var separator = UIColor.colorCode(232, 232, 232)
    
    public static func colorCode(
        _ red: Int,
        _ green: Int,
        _ blue: Int,
        _ alpha: Int = 1
    ) -> UIColor {
        return UIColor(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
