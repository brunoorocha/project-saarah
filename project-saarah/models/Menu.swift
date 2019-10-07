//
//  Menu.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class Menu {
	let menuItens: [MenuItem]
	let promotions: [Promotion]

	init(menuItens: [MenuItem], promotions: [Promotion]) {
		self.menuItens = menuItens
		self.promotions = promotions
	}
}
