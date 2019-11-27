//
//  AccountWorker.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 05/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AccountStore {
	func signUp(name: String, email: String, password: String, confirmPassword: String, _ completion: @escaping (Result<SessionResponse?, StoreError>) -> Void)
    func login(email: String, password: String, _ completion: @escaping (Result<SessionResponse?, StoreError>) -> Void)
    func session(_ completion: @escaping (Result<SessionResponse?, StoreError>) -> Void)
}

class AccountWorker {
	let accountService: AccountStore

	init(accountService: AccountStore) {
		self.accountService = accountService
	}

	func signUp(name: String, email: String, password: String, confirmPassword: String, _ completion: @escaping (Result<SessionResponse?, StoreError>) -> Void) {
		accountService.signUp(name: name, email: email, password: password, confirmPassword: confirmPassword) { (result) in
			DispatchQueue.main.async {
				completion(result)
			}
		}
	}

    func login(email: String, password: String, _ completion: @escaping (Result<SessionResponse?, StoreError>) -> Void) {
        accountService.login(email: email, password: password) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }

    func session(_ completion: @escaping (Result<SessionResponse?, StoreError>) -> Void) {
        accountService.session { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
