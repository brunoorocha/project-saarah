//
//  ApiResponseErrorAdapter.swift
//  project-saarah
//
//  Created by Bruno Rocha on 13/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class StoreErrorAdapter {
    static func fromNetworkServiceError (error: NetworkServiceError) -> StoreError? {
        switch error {
        case .errorStatusCode(_, let errorData):
            guard let errorData = errorData else { return nil }
            do {
                let apiError = try JSONDecoder().decode(ApiResponseError.self, from: errorData)
                let fieldErrors = apiError.errors.map { return FormFieldError(error: $0.errorCode, field: $0.field ?? "")}
                return StoreError.form(fields: fieldErrors)
            } catch {
                return nil
            }
        default:
            return nil
        }
    }
}
