//
//  FormData.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 06/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

struct FormData {
	let fieldName: String
	let placeholder: String
	let cellType: Int
	let inputType: Int
	
	init(dictionary: [String: Any]) {
		if let fieldName = dictionary["fieldName"] as? String {
			self.fieldName = fieldName
		}
		else {
			self.fieldName = ""
		}
		if let placeholder = dictionary["placeholder"] as? String {
			self.placeholder = placeholder
		}
		else {
			self.placeholder = ""
		}
		if let cellType = dictionary["cellType"] as? Int {
			self.cellType = cellType
		}
		else {
			self.cellType = -1
		}
		if let inputType = dictionary["inputeType"] as? Int {
			self.inputType = inputType
		}
		else {
			self.inputType = -1
		}
	}
}
