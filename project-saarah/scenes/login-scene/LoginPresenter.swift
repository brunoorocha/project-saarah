//
//  LoginPresenter.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol LoginPresentationLogic {
	func presentSomething(response: Login.Something.Response)
}

class LoginPresenter: LoginPresentationLogic {
	weak var viewController: LoginDisplayLogic?

	// MARK: Do something
	func presentSomething(response: Login.Something.Response) {
//		let viewModel = Login.Something.ViewModel()
//		viewController?.displaySomething(viewModel: viewModel)
	}
}
