//
//  UserDefaults+Token.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 06/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

extension UserDefaults {
	static func save(_ token: String) {
		UserDefaults.standard.setValue("bearer \(token)", forKey: "token")
	}

	static func token() -> String? {
		return UserDefaults.standard.value(forKey: "token") as? String
	}
    
    static func removeToken() {
        return UserDefaults.standard.setValue(nil, forKey: "token")
    }

	static func hasToken() -> Bool {
		return UserDefaults.standard.object(forKey: "token") != nil
	}
}
