//
//  ProductLog.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class ProductLog {
	let id: Int
	let type: LogType
	let price: Double?
	let quantity: Double
	let expiration: Date?

	init(id: Int, type: LogType, price: Double?, quantity: Double, expiration: Date?) {
		self.id = id
		self.type = type
		self.price = price
		self.quantity = quantity
		self.expiration = expiration
	}
}
