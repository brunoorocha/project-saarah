//
//  SettingsInteractor.swift
//  project-saarah
//
//  Created by Bruno Rocha on 05/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SettingsBusinessLogic {
	func doSomething(request: Settings.Something.Request)
}

protocol SettingsDataStore {
	//var name: String { get set }
}

class SettingsInteractor: SettingsBusinessLogic, SettingsDataStore {
	var presenter: SettingsPresentationLogic?

	// MARK: Do something
	func doSomething(request: Settings.Something.Request) {
		let response = Settings.Something.Response()
		presenter?.presentSomething(response: response)
	}
}
