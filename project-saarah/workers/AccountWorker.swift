//
//  AccountWorker.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 05/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol AccountStore {
	func signUp(name: String, email: String, password: String, confirmPassword: String, _ completion: @escaping (Result<CreateAccount.SignUpResponse?, NetworkServiceError>) -> Void)
}

class AccountWorker: AccountStore {
	let accountService: AccountStore
	
	init(accountService: AccountStore) {
		self.accountService = accountService
	}
	
	func signUp(name: String, email: String, password: String, confirmPassword: String, _ completion: @escaping (Result<CreateAccount.SignUpResponse?, NetworkServiceError>) -> Void) {
		accountService.signUp(name: name, email: email, password: password, confirmPassword: confirmPassword) { (result) in
			DispatchQueue.main.async {
				completion(result)
			}
		}
	}
}
