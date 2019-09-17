//
//  MenuItem.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class MenuItem {
	let id: Int
	let name: String
	let price: Double
	let image: UIImage?
	let onMenu: Bool
	let products: [MenuItemProduct]

	init(id: Int, name: String, price: Double, imagePath: String?, onMenu: Bool, products: [MenuItemProduct]) {
		self.id = id
		self.name = name
		self.price = price
		self.onMenu = onMenu
		self.products = products

		if let imagePath = imagePath {
			let image = DocumentsDirectory.getImage(with: imagePath)
			self.image = image
		} else {
			self.image = nil
		}
	}
}
