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
                return "Product created"
            case .successResponseMessage:
                return "Do you want to create a product item?"
            case .alertOkAction:
                return "OK"
            case .alertAddProductItemAction:
				return "Now"
            case .alertCancelAction:
				return "Later"
            case .alertFormTitle:
				return "Error"
            case .alertFormName:
				return "You must fill the name field."
            case .alertFormBarCode:
				return "The bar code must contain only numbers."
            case .alertFormMeasure:
				return "Select a measure unit."
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
            case .myAccountText:
                return "My account"
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
        case .registerSectionFooterView(let options):
            switch options {
            case .title:
                return "Don't have account yet?"
            case .registerButton:
                return "Sign up here"
            }
        case .loginScene(let options):
            switch options {
            case .title:
                return "Login"
            case .textField(let fields):
                switch fields {
                case .mail:
                    return "Email"
                case .mailPlaceholder:
                    return "Tap to type your email"
                case .password:
                    return "Password"
                case .passwordPlaceholder:
                    return "Tap to type your password"
                }
            case .greeting(let greetings):
                switch greetings {
                case .title:
                    return "Hello, welcome back!"
                case .description:
                    return "Log in with your account to continue."
                }
            case .errorFormValidation(let error):
                switch error {
                case .alertTitle:
                    return "An error ocurrent when try to login, try again!"
                case .action:
                    return "Close"
                case .email:
                    return "Fill the email field"
                case .password:
                    return "Fill the password field"
                case .undefined:
                    return ""
                }
            }
        case .createAccountScene(let options):
			switch options {
			case .headerTitle:
				return "Don't have an account?"
			case .headerSubtitle:
				return "No problem. You can create one account quickly."
			case .nameCellTitle:
				return "Name"
			case .nameCellPlaceholder:
				return "Tap to type your name"
			case .emailCellTitle:
				return "Email"
			case .emailCellPlaceholder:
				return "Tap to type your email"
			case .passwordCellTitle:
				return "Password"
			case .passwordCellPlaceholder:
				return "Tap to type your password"
			case .confirmPasswordCellTitle:
				return "Confirm password"
			case .confirmPasswordCellPlaceholder:
				return "Tap to type your password again"
			case .createAccountButtonTitlle:
				return "Create account"
			case .errorFormAlertTitle:
				return "Error"
			case .errorFormActionTitle:
				return "Ok"
			case .errorFormNameMessage:
				return "The name field must be filled out!"
			case .errorFormEmailMessage:
				return "The email field must be filled out!"
			case .errorFormInvalidEmail:
				return "Insert a valid Email!"
			case .errorFormPasswordMessage:
				return "The password field must be filled out!"
			case .errorFormConfirmPasswordMessage:
				return "The confirm password field must be filled out!"
			case .errorFormPasswordsDontMatchMessage:
				return "The passwords dont match!"
			case .errorFormPasswordSize:
				return "The password must contain at least 6 characters!"
			case .errorSignUpTitle:
				return "Sign up error"
			case .errorSignUpMessage:
				return "An error ocurrent when sign up, try again!"
			}
        case .onboarding(let options):
            switch options {
            case .before:
                return "Before"
            case .next:
                return "Next"
            case .close:
                return "Close"
            case .description(let descriptions):
                switch descriptions {
                case .first:
                    return "Keep track of your products in Restaurant or Snackbar."
                case .second:
                    return "Set up your menu based on the products in stock."
                case .third:
                    return "Track the inputs and outputs of products and dishes of your business."
                }
            }
        case .errorMessage(let options):
            switch options {
            case .api(let apiError):
                switch apiError {
                case .notFoundUserWithEmail:
                    return "There's no user found with this email"
                case .passwordDoesntMatchForUserWithEmail:
                    return "Your password is wrong"
                case .unauthorizedObjectAccess:
                    return "Sorry, but you don't have permission to access this object"
                case .unableToRemoveObject:
                    return "The object could not be removed"
                case .unableToCreateObject:
                    return "The object could not be created"
                case .objectNotFound:
                    return "Object not found"
                case .objectWithThisPropertyAlreadyExists:
                    return "Already exists a object with this property"
                case .invalidValue:
                    return "Invalid value"
                case .alreadyExistsAnUserWithEmail:
                    return "Already exists an account using this email"
                }
            }
        default:
            return nil
        }
    }
}
