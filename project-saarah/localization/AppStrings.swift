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
    case registerSectionFooterView(RegisterSectionFooterView)
    case loginScene(LoginScene)
    case underConstruction(UnderConstruction)
    case settingsScene(SettingsScene)
    case createAccountScene(CreateAccountScene)
    case onboarding(Onboarding)

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
        case basicInformation
        case barButton(BarButton)
        case field(Field)
        case alert(Alert)
        case response(Response)

        enum BarButton {
            case save
            case cancel
        }

        enum Alert {
            case okAction
            case cancelAction
            case addProductItemAction
            case form(Form)

            enum Form {
                case title
                case name
                case barCode
                case meausre
            }
        }

        enum Response {
            case success(Success)

            enum Success {
                case title
                case message
            }
        }

        enum Field {
            case productName
            case productNamePlaceholder
            case barCode
            case barCodePlacehoder
            case measure
            case measurePlaceholder
        }
    }

    enum ProductItemScene {
        case title
        case notInformed
    }

    enum AddProductItemScene {
        case title
        case alertActionTitle
        case basicInformation
        case complementaryInformation
        case barButton(BarButton)
        case field(Field)
        case errorForm(ErrorForm)
        case response(Response)

        enum BarButton {
            case save
            case cancel
        }

        enum Field {
            case quantity
            case quantityPlaceholder
            case price
            case pricePlaceholder
            case expirationDate
            case expirationDatePlaceholder
        }

        enum ErrorForm {
            case alertTitle
            case actionAlert
            case quantityAlertMessage
            case priceAlertMessage
            case expirationAlertMessage
        }

        enum Response {
            case successTitle
            case suceessMessage
            case inputErrorTitle
            case expirationDateMessage
        }
    }

    enum RegisterSectionFooterView {
        case title
        case registerButton
    }

    enum LoginScene {
        case title
        case textField(TextField)
        case greeting(Greeting)
        case errorFormValidation(ErrorFormValidation)

        enum TextField {
            case mail
            case mailPlaceholder
            case password
            case passwordPlaceholder
        }

        enum ErrorFormValidation {
            case alertTitle
            case action
            case email
            case password
            case undefined
        }

        enum Greeting {
            case title
            case description
        }
    }

    enum UnderConstruction {
        case title
        case paragraph
    }

    enum SettingsScene {
        case logoutText
        case myAccountText
        case logoutConfirmation(LogoutConfirmation)

        enum LogoutConfirmation {
            case title
            case message
            case logout
            case cancel
        }
    }
    enum CreateAccountScene {
        case createAccountButtonTitle
        case header(Header)
        case field(Field)
        case errorForm(ErrorForm)

        enum Header {
            case title
            case subtitle
        }

        enum Field {
            case nameTitle
            case namePlaceholder
            case emailTitle
            case emailPlaceholder
            case passwordTitle
            case passwordPlaceholder
            case confirmPasswordTitle
            case confirmPasswordPlaceholder
        }

        enum ErrorForm {
            case alertTitle
            case actionTitle
            case nameMessage
            case emailMessage
            case invalidEmail
            case passwordMessage
            case confirmPasswordMessage
            case passwordsDontMatchMessage
            case passwordSize
            case signUpTitle
            case signUpMessage
        }
    }

    enum Onboarding {
        case previous
        case next
        case close
        case description(Description)

        enum Description {
            case first
            case second
            case third
        }
    }
}
