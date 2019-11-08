//
//  ProductLog.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class ProductLog: Decodable {
	let id: String
	let type: LogType
	let price: Double?
	let quantity: Double
    let createdDate: Date
	let expiration: Date?

    init(id: String, type: LogType, price: Double?, quantity: Double, createdDate: Date, expiration: Date?) {
		self.id = id
		self.type = type
		self.price = price
		self.quantity = quantity
        self.createdDate = createdDate
		self.expiration = expiration
	}

	private enum CodingKeys: String, CodingKey {
		case id
		case price
		case quantity
		case expiration
		case createdDate = "createdAt"
	}

	required init(from decoder: Decoder) throws {
		// TODO: receive logtype from api
		self.type = LogType.input

		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.id = try values.decode(String.self, forKey: .id)
		self.price = try values.decode(Double?.self, forKey: .price)
		self.quantity = try values.decode(Double.self, forKey: .quantity)

		let createdDateString = try values.decode(String.self, forKey: .createdDate)
		if let date = DateFormat.dateFromTimeZone(createdDateString) {
			self.createdDate = date
		} else {
			throw NSError(domain: "Invalide date from server", code: 999, userInfo: nil)
		}

		let expirationString = try values.decodeIfPresent(String.self, forKey: .expiration)
        if let expirationString = expirationString {
            self.expiration = DateFormat.dateFromTimeZone(expirationString)
        } else {
            self.expiration = nil
        }
	}
}
