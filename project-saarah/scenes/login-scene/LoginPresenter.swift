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
}

class LoginPresenter: LoginPresentationLogic {
	weak var viewController: LoginDisplayLogic?

	// MARK: Do something
	func presentLoginResponse(response: Login.LogIn.Response) {
        if (response.response != nil) {
            let viewModel = Login.LogIn.ViewModel.LoginViewModel(success: true)
            viewController?.displaySignInResponse(viewModel: viewModel)
        } else {
            let viewModel = Login.LogIn.ViewModel.LoginViewModel(success: false)
            viewController?.displaySignInResponse(viewModel: viewModel)
        }
	}
}
