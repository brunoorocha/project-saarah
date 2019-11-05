//
//  CreateAccountPresenter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol CreateAccountPresentationLogic {
	func presentSignUpResponse(response: CreateAccount.SignUp.Response)
}

class CreateAccountPresenter: CreateAccountPresentationLogic {
	weak var viewController: CreateAccountDisplayLogic?

	// MARK: Do something
	func presentSignUpResponse(response: CreateAccount.SignUp.Response) {
		if (response.response != nil) {
			let viewModel = CreateAccount.SignUp.ViewModel.SignUpViewModel(success: true)
			viewController?.displaySignUpResponse(viewModel: viewModel)
		}
	}
}
