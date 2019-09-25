//
//  AppStyleGuide.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

enum AppStyleGuide {

    enum Margins: CGFloat {
        case xsmall = 4.0
        case small = 8.0
        case medium = 16.0
        case large = 32.0
        case xlarge = 64.0
    }

    enum Typography {
        case heading1
        case heading2
        case heading3
        case paragraph
        case caption

        var uiFont: UIFont {
            switch self {
            case .heading1:
                return UIFont(name: "Nunito-Black", size: 32.0) ?? UIFont.systemFont(ofSize: 32.0)
            case .heading2:
                return UIFont(name: "Nunito-Bolf", size: 24.0) ?? UIFont.systemFont(ofSize: 24.0)
            case .heading3:
                return UIFont(name: "Nunito-Bold", size: 16.0) ?? UIFont.systemFont(ofSize: 16.0)
            case .paragraph:
                return UIFont(name: "Nunito-Regular", size: 16.0) ?? UIFont.systemFont(ofSize: 16.0)
            case .caption:
                return UIFont(name: "Nunito-Bold", size: 16.0) ?? UIFont.systemFont(ofSize: 16.0)
            }
        }
    }

    enum Colors {
        case primary
        case background
        case foreground
        case textColor

        var uiColor: UIColor {
            switch self {
            case .primary:
                return UIColor(red: (88 / 255.0), green: (72 / 255.0), blue: (160 / 255.0), alpha: 1.0)
            case .background:
                return UIColor(red: (248 / 255.0), green: (248 / 255.0), blue: (248 / 255.0), alpha: 1.0)
            case .foreground:
                return UIColor.white
            case .textColor:
                return UIColor(red: (56 / 255.0), green: (56 / 255.0), blue: (56 / 255.0), alpha: 1.0)
            }
        }
    }
}
