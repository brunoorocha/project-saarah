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
    case selectProductMeasurement(SelectProductMeasurement)
	case addNewProductScene(AddNewProductScene)
    case productItemScene(ProductItemScene)
	case addProductItemScene(AddProductItemScene)
    case underConstruction(UnderConstruction)

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
        case title
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

    enum SelectProductMeasurement {
        case title
    }

	enum AddNewProductScene {
		case title
		case cancelBarButton
		case saveBarButton
		case basicInformation
		case productName
		case productNamePlaceholder
		case barCode
		case barCodePlacehoder
		case measure
		case measurePlaceholder
		case successResponseTitle
		case successResponseMessage
		case alertOkAction
		case alertCancelAction
		case alertAddProductItemAction
	}

    enum ProductItemScene {
        case title
        case notInformed
    }

	enum AddProductItemScene {
		case title
		case cancelBarButton
		case saveBarButton
		case alertActionTitle
		case basicInformation
		case quantity
		case quantityPlaceholder
		case price
		case pricePlaceholder
		case complementaryInformation
		case expirationDate
		case expirationDatePlaceholder
		case errorFormAlertTitle
		case errorFormActionAlertTitle
		case errorFormQuantityAlertMessage
		case errorFormPriceAlertMessage
		case errorFormExpirationAlertMessage
		case response(Response)

		enum Response {
			case successTitle
			case suceessMessage
			case inputErrorTitle
			case expirationDateMessage
		}
	}

    enum UnderConstruction {
        case title
        case paragraph
    }
}
