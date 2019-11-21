//
//  LoginPresenter.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol LoginPresentationLogic {
    func presentLoginResponse(response: Login.LogIn.Response.Success)
    func presentFormErrorsResponse(response: Login.LogIn.Response.Failure)
}

class LoginPresenter: LoginPresentationLogic {
	weak var viewController: LoginDisplayLogic?

    func presentLoginResponse(response: Login.LogIn.Response.Success) {
        viewController?.displaySignInResponse()
	}

    func presentFormErrorsResponse(response: Login.LogIn.Response.Failure) {
        let formErrorViewModels = response.formErrors.map { formError -> Login.LogIn.ViewModel.FormErrorViewModel in
            guard let apiResponseError = ApiPossibleResponseErrors(rawValue: formError.error) else {
                return Login.LogIn.ViewModel.FormErrorViewModel(field: "", message: "")
            }

            let errorMessage = Localization(.errorMessage(.api(apiResponseError))).description
            return Login.LogIn.ViewModel.FormErrorViewModel(field: formError.field, message: errorMessage)
        }

        viewController?.displayFormErrors(viewModels: formErrorViewModels)
    }
}
