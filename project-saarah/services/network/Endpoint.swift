//
//  Endpoint.swift
//  project-saarah
//
//  Created by Bruno Rocha on 18/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol EndpointType {
    var url: URL? { get }
    var httpMethod: HttpMethod { get }
    var body: String? { get }
    var headers: [String : String]? { get } 
}
