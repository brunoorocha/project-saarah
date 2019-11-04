//
//  CreateAccountPresenter.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol CreateAccountPresentationLogic {
	func presentSomething(response: CreateAccount.Something.Response)
}

class CreateAccountPresenter: CreateAccountPresentationLogic {
	weak var viewController: CreateAccountDisplayLogic?

	// MARK: Do something
	func presentSomething(response: CreateAccount.Something.Response) {
//		let viewModel = CreateAccount.Something.ViewModel()
//		viewController?.displaySomething(viewModel: viewModel)
	}
}
