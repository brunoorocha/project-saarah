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
    case fetchProducts
}

extension ConeheadApiEndpoint: EndpointType {
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
        case .fetchProducts:
            return .get
        }
    }

    var path: String {
        switch self {
        case .fetchNotifications:
            return apiAddress + "notifications"
        case .fetchProducts:
            return apiAddress + "products"
        }
    }

    var body: [String: Any]? {
        get { return nil }
        set {
            // do something
        }
    }
}
