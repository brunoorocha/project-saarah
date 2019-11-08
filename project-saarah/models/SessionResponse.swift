//
//  SignUpResponse.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 05/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

struct SessionResponse: Decodable {
	let id: String
	let name: String
	let email: String
	let token: String
}
