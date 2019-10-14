//
//  AppStrings.swift
//  project-saarah
//
//  Created by Thiago Valente on 14/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum AppStrings {

    // MARK: Cases

    case seeAll
    case buttonTableViewCell(ButtonTableViewCell)
    case labeledTableViewCell(LabeledTableViewCell)
    case productItemTableViewCell(ProductItemTableViewCell)
    case homeMenuOptionTitle(HomeMenuOptionTitle)
    case listInventoryScene(ListInventoryScene)
    case homeScene(HomeScene)
    case productDetailScene(ProductDetailScene)

    // MARK: Enum's

    enum ButtonTableViewCell {
        case title
    }

    enum LabeledTableViewCell {
        case productLabel
    }

    enum ProductItemTableViewCell {
        case amountLabel
        case validityLabel
        case priceLabel
        case addedOnDayLabel
    }

    enum HomeMenuOptionTitle {
        case inventory
        case menu
        case measurers
        case settings
    }

    enum ListInventoryScene {
        case title
        case productInStock
        case addAlertController(AddAlertController)

        enum AddAlertController {
            case title
            case addWithBarCode
            case addWithoutBarCode
            case cancel
        }
    }

    enum HomeScene {
        case notification
    }

    enum ProductDetailScene {
        case title
        case basicInformation
        case activity
        case productName
        case quantityInStock
        case seeAllFromThisProduct
    }
}
