//
//  Promotion.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class Promotion {
	let id: Int
	let menuItemPromotions: [MenuItemPromotion]
	let name: String
	let price: Double
	let image: UIImage?
	let startDay: Date
	let endDay: Date
	let startHour: Date
	let endHour: Date
	let days: [Int]

	init(id: Int, menuItemPromotions: [MenuItemPromotion], name: String, price: Double, imagePath: String?, startDay: Date, endDay: Date, startHour: Date, endHour: Date, days: [Int]) {
		self.id = id
		self.menuItemPromotions = menuItemPromotions
		self.name = name
		self.price = price
		self.startDay = startDay
		self.endDay = endDay
		self.startHour = startHour
		self.endHour = endHour
		self.days = days

		if let imagePath = imagePath {
			let image = DocumentsDirectory.getImage(with: imagePath)
			self.image = image
		} else {
			self.image = nil
		}
	}
}
