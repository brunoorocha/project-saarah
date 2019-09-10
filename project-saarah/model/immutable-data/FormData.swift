//
//  FormData.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 06/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class FormData {
	let fieldName: String
	let placeholder: String
	let cellType: Int
	let inputType: Int
	let key: String
	var inputData: [String: Any]

	init(dictionary: [String: Any]) {
		if let fieldName = dictionary["fieldName"] as? String {
			self.fieldName = fieldName
		} else {
			self.fieldName = ""
		}
		if let placeholder = dictionary["placeholder"] as? String {
			self.placeholder = placeholder
		} else {
			self.placeholder = ""
		}
		if let cellType = dictionary["cellType"] as? Int {
			self.cellType = cellType
		} else {
			self.cellType = -1
		}
		if let inputType = dictionary["inputType"] as? Int {
			self.inputType = inputType
		} else {
			self.inputType = -1
		}
		if let key = dictionary["key"] as? String {
			self.key = key
		} else {
			self.key = ""
		}
		self.inputData = [:]
	}
}
