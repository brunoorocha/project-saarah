//
//  DateFormat.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 23/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

struct DateFormat {
	static func dateFromTimeZone(_ string: String) -> Date? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		
		return dateFormatter.date(from: string)
	}
}
