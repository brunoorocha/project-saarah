//
//  CreateAccountInteractor.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol CreateAccountBusinessLogic {
	func signUp(request: CreateAccount.SignUp.Request)
}

protocol CreateAccountDataStore {
	var signUpResponse: SessionResponse? { get set }
}

class CreateAccountInteractor: CreateAccountBusinessLogic, CreateAccountDataStore {
	var presenter: CreateAccountPresentationLogic?
	var accountWorker = AccountWorker(accountService: ApiAccountStore())

	var signUpResponse: SessionResponse?

	// MARK: Do something
	func signUp(request: CreateAccount.SignUp.Request) {
		accountWorker.signUp(name: request.signUpForm.name, email: request.signUpForm.email, password: request.signUpForm.password, confirmPassword: request.signUpForm.confirmPassword) { (result) in
			switch result {
			case .success(let response):
				guard let signUpResponse = response else { return }
				UserDefaults.save(signUpResponse.token)
				self.signUpResponse = signUpResponse
                self.presenter?.presentSignUpSucessResponse(response: CreateAccount.SignUp.Response.Success())
			case .failure(let error):
                self.handleStoreErrors(error: error)
			}
		}
	}

    private func handleStoreErrors (error: StoreError) {
        switch error {
        case .form(let fields):
            let response = CreateAccount.SignUp.Response.Failure(formErrors: fields)
            self.presenter?.presentSignUpFailureResponse(response: response)
        case .plain(let message):
            print(message)
        }
    }
}
