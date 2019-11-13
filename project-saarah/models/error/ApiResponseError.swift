//
//  ApiResponseError.swift
//  project-saarah
//
//  Created by Bruno Rocha on 11/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

struct ApiResponseError {
    let errors: [ApiError]
}

extension ApiResponseError: Decodable {
    enum CodingKeys: CodingKey {
        case errors
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decode([ApiError].self, forKey: .errors)
    }
}

struct ApiError {
    var field: String?
    var errorCode: String
}

extension ApiError: Decodable {
    enum CodingKeys: CodingKey {
        case field
        case errorCode
    }

    init (from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        field = try values.decodeIfPresent(String.self, forKey: .field)
        errorCode = try values.decode(String.self, forKey: .errorCode)
    }
}
