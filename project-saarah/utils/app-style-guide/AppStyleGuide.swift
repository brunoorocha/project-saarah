//
//  AppStyleGuide.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

enum AppStyleGuide {

    // MARK: Margins
    enum Margins: CGFloat {
        case xsmall = 4.0
        case small = 8.0
        case medium = 16.0
        case large = 32.0
        case xlarge = 64.0
    }

    // MARK: Sizes
    enum Sizes: CGFloat {
        case cornerRadius = 8.0
    }

    // MARK: Typography
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
                return UIFont(name: "Nunito-Black", size: 24.0) ?? UIFont.systemFont(ofSize: 24.0)
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

    // MARK: Colors
    enum Colors {
        case primary
        case background
        case foreground
        case textColor
        case lightGray
        case mediumGray
        case darkCyan
        case orange
        case red
        case gray
        case lightRed
        case lightPurple
        case lightYellow

        var uiColor: UIColor {
            switch self {
            case .primary:
                return UIColor.setupColorFor(.lightModePrimary, .darkModePrimary)

            case .background:
                return UIColor.setupColorFor(.lightModeBackground, .darkModeBackground)

            case .foreground:
                return UIColor.setupColorFor(.lightModeForeground, .darkModeForeground)

            case .textColor:
                return UIColor.setupColorFor(.lightModeTextColor, .darkModeTextColor)

            case .lightGray:
                return UIColor.setupColorFor(.lightModeLightGray, .darkModeLightGray)

            case .mediumGray:
                return UIColor.rgba(168, 168, 168)
            case .darkCyan:
                return UIColor.rgba(48, 128, 144)
            case .orange:
                return UIColor.rgba(224, 133, 48)
            case .red:
                return UIColor.setupColorFor(UIColor.rgba(224, 48, 48), UIColor.rgba(250, 102, 102))
            case .gray:
                return UIColor.rgba(96, 96, 96)
            case .lightRed:
                return UIColor.rgba(250, 225, 225)
            case .lightPurple:
                return UIColor.rgba(237, 237, 250)
            case .lightYellow:
                return UIColor.rgba(250, 244, 225)
            }
        }
    }

    // MARK: Icons
    enum Icons {
        case onboardingControl
        case onboardingMenu
        case onboardingMoney
        case activityArrowUp
        case chevronRight
        case check
        case inventory
        case menu
        case barchart
        case settings
        case cone
        case plus

        var uiImage: UIImage? {
            switch self {
            case .onboardingControl:
                return UIImage(named: "onboarding-control")
            case .onboardingMenu:
                return UIImage(named: "onboarding-menu")
            case .onboardingMoney:
                return UIImage(named: "onboarding-money")
            case .activityArrowUp:
                return UIImage(named: "activity-arrow-up")
            case .chevronRight:
                return UIImage(named: "chevron-right")
            case .check:
                return UIImage(named: "check")?.withRenderingMode(.alwaysTemplate)
            case .inventory:
                return UIImage(named: "inventory-icon")
            case .menu:
                return UIImage(named: "menu-icon")
            case .barchart:
                return UIImage(named: "barchart-icon")
            case .settings:
                return UIImage(named: "settings-icon")
            case .cone:
                return UIImage(named: "traffic-cone")
            case .plus:
                return UIImage(named: "plus")
            }
        }
    }
}
