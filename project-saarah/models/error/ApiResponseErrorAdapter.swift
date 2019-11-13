//
//  ApiResponseErrorAdapter.swift
//  project-saarah
//
//  Created by Bruno Rocha on 13/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class ApiResponseErrorAdapter {
    static func fromNetworkServiceError (error: NetworkServiceError) {
        switch error {
        case .errorStatusCode(_, let errorData):
            guard let errorData = errorData else { return }
            do {
                let apiError = try JSONDecoder().decode(ApiResponseError.self, from: errorData)
                print(apiError)
            } catch let error {
                print(error)
            }
        default:
            print(error)
        }
    }
}
