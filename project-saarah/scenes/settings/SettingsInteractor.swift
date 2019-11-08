//
//  SettingsInteractor.swift
//  project-saarah
//
//  Created by Bruno Rocha on 05/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SettingsBusinessLogic {
	func doLogOut(request: Settings.Logout.Request)
}

protocol SettingsDataStore {}

class SettingsInteractor: SettingsBusinessLogic, SettingsDataStore {
	var presenter: SettingsPresentationLogic?

    func doLogOut(request: Settings.Logout.Request) {
        UserDefaults.removeToken()
        let response = Settings.Logout.Response()
        presenter?.presentLogOutSuccessMessage(response: response)
    }
}
