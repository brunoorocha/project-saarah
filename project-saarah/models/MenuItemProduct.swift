//
//  MenuItemProduct.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class MenuItemProduct {
	let product: Product
	let quantity: Double

	init(product: Product, quantity: Double) {
		self.product = product
		self.quantity = quantity
	}
}
