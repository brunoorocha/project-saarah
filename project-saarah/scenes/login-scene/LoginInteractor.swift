//
//  LoginInteractor.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol LoginBusinessLogic {
    func logIn(request: Login.LogIn.Request)
}

protocol LoginDataStore {
	var loginResponse: SessionResponse? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {

    var presenter: LoginPresentationLogic?
    var accountWorker = AccountWorker(accountService: ApiAccountStore())

    var loginResponse: SessionResponse?

    // MARK: Do something
    func logIn(request: Login.LogIn.Request) {
        accountWorker.login(email: request.form.email, password: request.form.passowrd) { (result) in
            switch result {
            case .success(let response):
                guard let loginResponse = response else { return }
                UserDefaults.save(loginResponse.token)
                self.loginResponse = loginResponse
                self.presenter?.presentLoginResponse(response: Login.LogIn.Response(response: loginResponse))
            case .failure(let error):
                self.handleStoreErrors(error: error)
            }
        }
    }

    private func handleStoreErrors (error: StoreError) {
        switch error {
        case .form(let fields):
            let response = Login.LogIn.Response(formErrors: fields)
            self.presenter?.presentFormErrorsResponse(response: response)
        case .plain(let message):
            print(message)
        }
    }
}
