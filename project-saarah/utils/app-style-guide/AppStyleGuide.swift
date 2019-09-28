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

    enum Sizes: CGFloat {
        case cornerRadius = 8.0
    }

    enum Typography {
        case heading1
        case heading2
        case heading3
        case paragraph
        case caption
        case captionBold

        var uiFont: UIFont {
            switch self {
            case .heading1:
                return UIFont(name: "Nunito-Black", size: 32.0) ?? UIFont.systemFont(ofSize: 32.0)
            case .heading2:
                return UIFont(name: "Nunito-Bold", size: 24.0) ?? UIFont.systemFont(ofSize: 24.0)
            case .heading3:
                return UIFont(name: "Nunito-Bold", size: 16.0) ?? UIFont.systemFont(ofSize: 16.0)
            case .paragraph:
                return UIFont(name: "Nunito-Regular", size: 16.0) ?? UIFont.systemFont(ofSize: 16.0)
            case .caption:
                return UIFont(name: "Nunito-Regular", size: 12.0) ?? UIFont.systemFont(ofSize: 12.0)
            case .captionBold:
                return UIFont(name: "Nunito-Bold", size: 12.0) ?? UIFont.systemFont(ofSize: 12.0)
            }
        }
    }

    enum Colors {
        case primary
        case background
        case foreground
        case textColor
        case lightGray
        case mediumGray

        var uiColor: UIColor {
            switch self {
            case .primary:
                return UIColor.rgba(88, 72, 160)
            case .background:
                return UIColor.rgba(248, 248, 248)
            case .foreground:
                return UIColor.white
            case .textColor:
                return UIColor.rgba(56, 56, 56)
            case .lightGray:
                return UIColor.rgba(244, 244, 244)
            case .mediumGray:
                return UIColor.rgba(168, 168, 168)
            }
        }
    }

    enum Icons {
        case activityArrowUp
        case chevronRight
        case check

        var uiImage: UIImage? {
            switch self {
            case .activityArrowUp:
                return UIImage(named: "activity-arrow-up")
            case .chevronRight:
                return UIImage(named: "chevron-right")
            case .check:
                return UIImage(named: "check")
            }
        }
    }
}
