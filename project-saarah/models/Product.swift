//
//  Product.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class Product {
	let id: Int
	let name: String
	let measure: Measure
	let barCode: String?
	let log: [ProductLog]

	init(id: Int, name: String, measure: Measure, barCode: String?, log: [ProductLog]) {
		self.id = id
		self.name = name
		self.measure = measure
		self.barCode = barCode
		self.log = log
	}
}
