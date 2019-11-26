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
            case .label(let labels):
                switch labels {
                case .amount:
                    return "Quantity"
                case .validity:
                    return "Validity"
                case .price:
                    return "Price"
                case .addedOnDay:
                    return "Added on Day"
                }
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
            case .basicInformation:
                return "Basic Infos"
            case .barButton(let buttons):
                switch buttons {
                case .save:
                    return "Save"
                case .cancel:
                    return "Cancel"
                }
            case .alert(let alerts):
                switch alerts {
                case .okAction:
                    return "Ok"
                case .cancelAction:
                    return "Later"
                case .addProductItemAction:
                    return "Now"
                case .form(let form):
                    switch form {
                    case .title:
                        return "Error"
                    case .name:
                        return "You must fill the product name field."
                    case .barCode:
                        return "The bar code must contain only numbers."
                    case .meausre:
                        return "Select a measure unit."
                    }
                }
            case .response(let responses):
                switch responses {
                case .success(let successes):
                    switch successes {
                    case .title:
                        return "Product created"
                    case .message:
                        return "Do you want to create a product item?"
                    }
                }
            case .field(let fields):
                switch fields {
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
                }
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
            case .alertActionTitle:
                return "Ok"
            case .information(let informations):
                switch informations {
                case .basic:
                    return "Basic Information"
                case .complementary:
                    return "Additional information (optional)"
                }
            case .barButton(let button):
                switch button {
                case .save:
                    return "Save"
                case .cancel:
                    return "Cancel"
                }
            case .field(let fields):
                switch fields {
                case .quantity:
                    return "Quantity"
                case .quantityPlaceholder:
                    return "0"
                case .price:
                    return "Price"
                case .pricePlaceholder:
                    return "$ 0,00"
                case .expirationDate:
                    return "Expiration"
                case .expirationDatePlaceholder:
                    return "Tap to enter expiration date"
                }
            case .errorForm(let errors):
                switch errors {
                case .alertTitle:
                    return "Error"
                case .action:
                    return "Ok"
                case .quantityAlertMessage:
                    return "The field quantity only accept numbers."
                case .priceAlertMessage:
                    return "The field price only accept numbers."
                case .expirationAlertMessage:
                    return "The field date of expiration date need be filled with day/month/year."
                }
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
            case .field(let fields):
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
            case .createAccountButtonTitle:
                return "Create account"
            case .header(let header):
                switch header {
                case .title:
                    return "Don't have an account?"
                case .subtitle:
                    return "No problem. You can create one account quickly."
                }
            case .field(let fields):
                switch fields {
                case .name:
                    return "Name"
                case .namePlaceholder:
                    return "Tap to type your name"
                case .email:
                    return "Email"
                case .emailPlaceholder:
                    return "Tap to type your email"
                case .password:
                    return "Password"
                case .passwordPlaceholder:
                    return "Tap to type your password"
                case .confirmPassword:
                    return "Confirm password"
                case .confirmPasswordPlaceholder:
                    return "Tap to type your password again"
                }
            case .errorForm(let errors):
                switch errors {
                case .alertTitle:
                    return "Error"
                case .action:
                    return "Ok"
                case .nameMessage:
                    return "The name field must be filled out!"
                case .emailMessage:
                    return "The email field must be filled out!"
                case .invalidEmail:
                    return "Insert a valid Email!"
                case .passwordMessage:
                    return "The password field must be filled out!"
                case .confirmPasswordMessage:
                    return "The confirm password field must be filled out!"
                case .passwordsDontMatchMessage:
                    return "The passwords dont match!"
                case .passwordSize:
                    return "The password must contain at least 6 characters!"
                case .signUpTitle:
                    return "Sign up error"
                case .signUpMessage:
                    return "An error ocurrent when sign up, try again!"
                }
            }
        case .onboarding(let options):
            switch options {
            case .previous:
                return "Previous"
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
        case .barcodeScene(let options):
            switch options {
            case .view(let views):
                switch views {
                case .notFound(let messages):
                    switch messages {
                    case .product:
                        return "Product not found."
                    case .overview:
                        return "You can create a new product in inventory with this barcode."
                    }
                }
            }
        case .errorMessage(let options):
            switch options {
            case .api(let apiError):
                switch apiError {
                case .notFoundUserWithEmail:
                    return "There's no account found with this email"
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
