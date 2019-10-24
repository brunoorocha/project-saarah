//
//  Measure.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class Measure: Decodable {
	let id: String
	let name: String

	init(id: String, name: String) {
		self.id = id
		self.name = name
	}
}

extension Measure {
    enum CodingKeys: CodingKey {
        case id
        case name
    }
}
