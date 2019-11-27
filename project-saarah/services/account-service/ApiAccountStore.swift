//
//  ApiAccountStore.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 05/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class ApiAccountStore: AccountStore {

    func session(_ completion: @escaping (Result<SessionResponse?, StoreError>) -> Void) {
          let networkService = NetworkService()
        networkService.request(endpoint: ConeheadApiEndpoint.session) { (result: Result<SessionResponse?, NetworkServiceError>) in
            self.handleResponse(result: result, completion)
        }
    }

    func login(email: String, password: String, _ completion: @escaping (Result<SessionResponse?, StoreError>) -> Void) {
        let networkService = NetworkService()
        networkService.request(endpoint: ConeheadApiEndpoint.login(email: email, passowrd: password)) { (result: Result<SessionResponse?, NetworkServiceError>) in
            self.handleResponse(result: result, completion)
        }
    }

	func signUp(name: String, email: String, password: String, confirmPassword: String, _ completion: @escaping (Result<SessionResponse?, StoreError>) -> Void) {
		let networkService = NetworkService()
		networkService.request(endpoint: ConeheadApiEndpoint.signUp(
            name: name, email: email, password: password,
            confirmPassword: confirmPassword)) { (result: Result<SessionResponse?, NetworkServiceError>) in
			self.handleResponse(result: result, completion)
		}
	}

    private func handleResponse (result: Result<SessionResponse?, NetworkServiceError>, _ completion: @escaping (Result<SessionResponse?, StoreError>) -> Void) {
        switch result {
        case .failure(let error):
            if let storeError = StoreErrorAdapter.fromNetworkServiceError(error: error) {
                completion(.failure(storeError))
                return
            }

            completion(.failure(StoreError.plain(message: "Unknow error")))
        case .success(let successResponse):
            completion(.success(successResponse))
        }
    }
}
