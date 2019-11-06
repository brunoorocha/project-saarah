//
//  LoginInteractor.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol LoginBusinessLogic {
	func doSomething(request: Login.Something.Request)
}

protocol LoginDataStore {
	//var name: String { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
	var presenter: LoginPresentationLogic?
//	var worker: LoginWorker?
	//var name: String = ""

	// MARK: Do something
	func doSomething(request: Login.Something.Request) {
//		worker = Worker()
//		worker?.doSomeWork()

		let response = Login.Something.Response()
		presenter?.presentSomething(response: response)
	}
}
