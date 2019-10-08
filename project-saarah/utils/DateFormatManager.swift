//
//  DateFormatManager.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 07/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

struct DateFormatManager {
	static func withSlash(from date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/yyyy"

		return dateFormatter.string(from: date)
	}
}
