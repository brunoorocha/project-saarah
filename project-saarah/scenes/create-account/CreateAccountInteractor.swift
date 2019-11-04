//
//  CreateAccountInteractor.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol CreateAccountBusinessLogic {
	func doSomething(request: CreateAccount.Something.Request)
}

protocol CreateAccountDataStore {
	//var name: String { get set }
}

class CreateAccountInteractor: CreateAccountBusinessLogic, CreateAccountDataStore {
	var presenter: CreateAccountPresentationLogic?
//	var worker: CreateAccountWorker?
	//var name: String = ""

	// MARK: Do something
	func doSomething(request: CreateAccount.Something.Request) {
//		worker = Worker()
//		worker?.doSomeWork()

		let response = CreateAccount.Something.Response()
		presenter?.presentSomething(response: response)
	}
}
