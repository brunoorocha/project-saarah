//
//  HomeMenuModels.swift
//  project-saarah
//
//  Created by Bruno Rocha on 28/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

enum HomeMenuOption: Int, CaseIterable {
    case inventory
    case menu
    case measurers
    case settings

    var title: String {
        switch self {
        case .inventory:
            return Localization(.homeMenuOptionTitle(.inventory)).description
        case .menu:
            return Localization(.homeMenuOptionTitle(.menu)).description
        case .measurers:
            return Localization(.homeMenuOptionTitle(.measurers)).description
        case .settings:
            return Localization(.homeMenuOptionTitle(.settings)).description
        }
    }

    var icon: AppStyleGuide.Icons {
        switch self {
        case .inventory:
            return AppStyleGuide.Icons.inventory
        case .menu:
            return AppStyleGuide.Icons.menu
        case .measurers:
            return AppStyleGuide.Icons.barchart
        case .settings:
            return AppStyleGuide.Icons.settings
        }
    }

    var highlightedColor: UIColor {
        switch self {
        case .inventory:
            return AppStyleGuide.Colors.primary.uiColor
        case .menu:
            return AppStyleGuide.Colors.darkCyan.uiColor
        case .measurers:
            return AppStyleGuide.Colors.orange.uiColor
        case .settings:
            return AppStyleGuide.Colors.gray.uiColor
        }
    }
}
