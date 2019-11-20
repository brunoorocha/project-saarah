//
//  LoginPresenter.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol LoginPresentationLogic {
	func presentLoginResponse(response: Login.LogIn.Response)
    func presentFormErrorsResponse(response: Login.LogIn.Response)
}

class LoginPresenter: LoginPresentationLogic {
	weak var viewController: LoginDisplayLogic?

	func presentLoginResponse(response: Login.LogIn.Response) {
        let viewModel = Login.LogIn.ViewModel.LoginViewModel(success: true)
        viewController?.displaySignInResponse(viewModel: viewModel)
	}

    func presentFormErrorsResponse(response: Login.LogIn.Response) {
        guard let formErrors = response.formErrors else { return }
        let formErrorViewModels = formErrors.map { formError -> Login.LogIn.ViewModel.FormError in
            guard let apiResponseError = ApiPossibleResponseErrors(rawValue: formError.error) else {
                return Login.LogIn.ViewModel.FormError(field: "", message: "")
            }

            let errorMessage = Localization(.errorMessage(.api(apiResponseError))).description
            return Login.LogIn.ViewModel.FormError(field: formError.field, message: errorMessage)
        }

        viewController?.displayFormErrors(viewModels: formErrorViewModels)
    }
}
