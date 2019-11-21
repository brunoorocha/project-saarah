//
//  CreateAccountPresenter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol CreateAccountPresentationLogic {
    func presentSignUpSucessResponse(response: CreateAccount.SignUp.Response.Success)
    func presentSignUpFailureResponse(response: CreateAccount.SignUp.Response.Failure)
}

class CreateAccountPresenter: CreateAccountPresentationLogic {
	weak var viewController: CreateAccountDisplayLogic?

	// MARK: Do something
    func presentSignUpSucessResponse(response: CreateAccount.SignUp.Response.Success) {
        viewController?.displaySignUpSuccessResponse()
	}

    func presentSignUpFailureResponse(response: CreateAccount.SignUp.Response.Failure) {
        let formErrorViewModels = response.formErrors.map { formFieldError -> CreateAccount.SignUp.ViewModel.FormErrorViewModel in
            guard let apiResponseError = ApiPossibleResponseErrors(rawValue: formFieldError.error) else {
                return CreateAccount.SignUp.ViewModel.FormErrorViewModel(field: "", message: "")
            }

            let errorMessage = Localization(.errorMessage(.api(apiResponseError))).description
            return CreateAccount.SignUp.ViewModel.FormErrorViewModel(field: formFieldError.field, message: errorMessage)
        }

        viewController?.displaySignUpFailureResponse(viewModels: formErrorViewModels)
    }
}
