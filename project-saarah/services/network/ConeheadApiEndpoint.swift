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
	case addProductItem(productId: String, price: Double, quantity: Double, expirationDate: String)
    case fetchProducts
}

extension ConeheadApiEndpoint: EndpointType {
	var body: String? {
		get {
			return caseBody
		}
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
        }
    }
	
	var caseBody: String? {
		switch self {
		case .fetchNotifications:
			return nil
		case .addProductItem(let productItem):
			return "quantity=\(productItem.quantity)&price=\(productItem.price)&expiration=\(productItem.expirationDate)"
		case .fetchProducts:
			return nil
		}
	}
}
