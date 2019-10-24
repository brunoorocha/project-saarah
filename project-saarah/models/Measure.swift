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
    let abbreviation: String

    init(id: String, name: String, abbreviation: String) {
		self.id = id
		self.name = name
        self.abbreviation = abbreviation
	}
}

extension Measure {
    enum CodingKeys: CodingKey {
        case id
        case name
        case abbreviation
    }
}
