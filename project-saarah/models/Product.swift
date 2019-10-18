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
	let logs: [ProductLog]

	init(id: Int, name: String, measure: Measure, barCode: String?, logs: [ProductLog]) {
		self.id = id
		self.name = name
		self.measure = measure
		self.barCode = barCode
		self.logs = logs
	}

    // TODO: - insert a real count quantity function
    func quantity() -> String {
        return "10"
    }
}
