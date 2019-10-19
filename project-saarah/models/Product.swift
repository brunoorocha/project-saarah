//
//  Product.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class Product: Decodable {
	let id: String
	let name: String
	let measure: Measure
	let barCode: String?
	let logs: [ProductLog]

	init(id: String, name: String, measure: Measure, barCode: String?, logs: [ProductLog]) {
		self.id = id
		self.name = name
		self.measure = measure
		self.barCode = barCode
		self.logs = logs
	}

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        barCode = try values.decodeIfPresent(String.self, forKey: .barCode)
        measure = try values.decode(Measure.self, forKey: .measurement)
        logs = []
    }

    // TODO: - insert a real count quantity function
    func quantity() -> String {
        return "10"
    }
}

extension Product {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case measurement
        case barCode
        case logs
    }
}
