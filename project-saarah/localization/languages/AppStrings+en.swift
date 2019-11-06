//
//  AppStrings+en.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 24/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

extension AppStrings {
    var en: String? {
        switch self {
        case .seeAll:
            return "See All"
        case .buttonTableViewCell(let options):
            switch options {
            case .title:
                return "Add more items to this Product"
            }
        case .labeledTableViewCell(let options):
            switch options {
            case .productLabel:
                return "Product"
            }
        case .productItemTableViewCell(let options):
            switch options {
            case .amountLabel:
                return "Quantity"
            case .validityLabel:
                return "Validity"
            case .priceLabel:
                return "Price"
            case .addedOnDayLabel:
                return "Added on Day"
            }
        case .homeMenuOptionTitle(let options):
            switch options {
            case .inventory:
                return "Inventory"
            case .menu:
                return "Menu"
            case .measurers:
                return "Meters"
            case .settings:
                return "Settings"
            }
        case .listInventoryScene(let options):
            switch options {
            case .title:
                return "Inventory"
            case .productInStock:
                return "Products in Inventory"
            case .addAlertController(let alertOptions):
                switch alertOptions {
                case .title:
                    return "Add new Product"
                case .addWithBarCode:
                    return "with Barcode"
                case .addWithoutBarCode:
                    return "without Barcode"
                case .cancel:
                    return "Cancel"
                }
            }
        case .homeScene(let options):
            switch options {
            case .notification:
                return "Notifications"
            case .title:
                return "eStorage"
            }
        case .productDetailScene(let options):
            switch options {
            case .title:
                return "Product Details"
            case .basicInformation:
                return "Basic Infos"
            case .activity:
                return "Activity"
            case .productName:
                return "Product Name"
            case .quantityInStock:
                return "Quantity in Inventory"
            case .seeAllFromThisProduct:
                return "View All items for this Product"
            }
        case .selectProductMeasurement(let options):
            switch options {
            case .title:
                return "Select Measurement Unit"
            }
        case .addNewProductScene(let options):
            switch (options) {
            case .title:
                return "Create New Product"
            case .cancelBarButton:
                return "Cancel"
            case .saveBarButton:
                return "Save"
            case .basicInformation:
                return "BASIC INFOS"
            case .productName:
                return "Product Name"
            case .productNamePlaceholder:
                return "Tap to type the Product Name"
            case .barCode:
                return "Barcode (Optional)"
            case .barCodePlacehoder:
                return "Tap to insert the Barcode"
            case .measure:
                return "Measurement Unit"
            case .measurePlaceholder:
                return "Pounds, Onces, Gallons..."
            case .successResponseTitle:
                return "Success"
            case .successResponseMessage:
                return "Success to save your Product in Server Cloud"
            case .alertAction:
                return "OK"
            }
        case .productItemScene(let options):
            switch options {
            case .title:
                return "Product Items"
            case .notInformed:
                return "Uninformed"
            }
        case .addProductItemScene(let options):
            switch options {
            case .title:
                return "Add product item"
            case .cancelBarButton:
                return "Cancel"
            case .saveBarButton:
                return "Save"
            case .alertActionTitle:
                return "Ok"
            case .basicInformation:
                return "BASIC INFORMATION"
            case .quantity:
                return "Quantity"
            case .quantityPlaceholder:
                return "0"
            case .price:
                return "Price"
            case .pricePlaceholder:
                return "$ 0,00"
            case .complementaryInformation:
                return "ADDITIONAL INFORMATION (OPTIONAL)"
            case .expirationDate:
                return "Expiration"
            case .expirationDatePlaceholder:
                return "Tap to enter expiration date"
            case .errorFormAlertTitle:
                return "Error"
            case .errorFormActionAlertTitle:
                return "Ok"
            case .errorFormQuantityAlertMessage:
                return "The field quantity only accept numbers."
            case .errorFormPriceAlertMessage:
                return "The field price only accept numbers."
            case .errorFormExpirationAlertMessage:
                return "The field date of expiration date need be filled with day/month/year."
            case .response(let options):
                switch (options) {
                case .successTitle:
                    return "Success"
                case .suceessMessage:
                    return "Item saved with success."
                case .inputErrorTitle:
                    return "Error to fill the field"
                case .expirationDateMessage:
                    return "The expiration date aren't filled correctly."
                }
            }
        case .settingsScene(let options):
            switch options {
            case .logoutText:
                return "Log out"
            case .logoutConfirmation(let options):
                switch options {
                case .logout:
                    return "Log Out"
                case .cancel:
                    return "Cancel"
                case .title:
                    return "Confirmation"
                case .message:
                    return "Do you really want to log out from application?"
                }
            }
        default:
            return nil
        }
    }
}
