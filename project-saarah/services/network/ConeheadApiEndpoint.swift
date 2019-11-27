//
//  ApiEndpoints.swift
//  project-saarah
//
//  Created by Bruno Rocha on 18/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum ConeheadApiEndpoint {
    case fetchNotifications
	case addProductItem(productId: String, price: Double, quantity: Double, expirationDate: String?)
    case fetchProducts
    case fetchMeasures
    case fetchProductItems(productId: String)
    case addProduct(name: String, barcode: String?, measureId: String)
    case signUp(name: String, email: String, password: String, confirmPassword: String)
    case login(email: String, passowrd: String)
    case session
    case fetchProduct(barcode: String)
}

extension ConeheadApiEndpoint: EndpointType {
    var body: String? {
        return caseBody
    }

    var apiAddress: String {
        return "https://conehead-api.herokuapp.com/api/v1/"
    }

    var url: URL? {
        return URL(string: self.path)
    }

    var httpMethod: HttpMethod {
        switch self {
        case .fetchNotifications:
            return .get
        case .addProductItem:
            return .post
        case .fetchProducts:
            return .get
        case .fetchMeasures:
            return .get
        case .fetchProductItems:
			return .get
        case .addProduct:
            return .post
        case .signUp:
			return .post
        case .login:
            return .post
        case .session:
            return .get
        case .fetchProduct:
            return .get
        }
    }

    var path: String {
        switch self {
        case .fetchNotifications:
            return apiAddress + "notifications"
        case .addProductItem(let productItem):
            return apiAddress + "products/" + productItem.productId + "/items"
        case .fetchProducts:
            return apiAddress + "products"
        case .fetchMeasures:
            return apiAddress + "measurements"
        case .fetchProductItems(let productId):
			return apiAddress + "/products/" + productId + "/items"
        case .addProduct:
            return apiAddress + "products"
        case .signUp:
			return apiAddress + "accounts"
        case .login:
            return apiAddress + "sessions"
        case .session:
            return apiAddress + "sessions"
        case .fetchProduct(let barcode):
            return apiAddress + "products" + "?barcode=\(barcode)"
        }
    }

    var caseBody: String? {
        switch self {
        case .fetchNotifications:
            return nil
        case .addProductItem(let productItem):
            var path = "quantity=\(productItem.quantity)&price=\(productItem.price)"
            if let expirationDate = productItem.expirationDate {
                path.append("&expiration=\(expirationDate)")
            }
            return path
        case .fetchProducts:
            return nil
        case .fetchMeasures:
            return nil
        case .fetchProductItems:
			return nil
        case .addProduct(let product):
            var path: String = "name=\(product.name)&measurementId=\(product.measureId)"
            if let barcode = product.barcode {
                path.append("&barcode=\(barcode)")
            }
            return path
        case .signUp(let parameters):
			let path = "name=\(parameters.name)&email=\(parameters.email)&password=\(parameters.password)&passwordConfirmation=\(parameters.confirmPassword)"
			return path
        case .login(let parameters):
            let path = "email=\(parameters.email)&password=\(parameters.passowrd)"
            return path
        case .session:
            return nil
        case .fetchProduct:
            return nil
		}
	}

    var headers: [String: String]? {
        return ["Authorization": UserDefaults.token() ?? ""]
    }
}
