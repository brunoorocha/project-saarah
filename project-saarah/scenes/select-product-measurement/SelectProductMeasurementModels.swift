//
//  SelectProductMeasurementModels.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum SelectProductMeasurement {
	// MARK: Use cases
	enum FetchMeasurements {
		struct Request {
		}
		struct Response {
            var measures: [Measure]
		}
		struct ViewModel {
			struct DisplayMeasurement {
                var name: String
			}
			var displayMeasurements: [DisplayMeasurement]
		}
	}
}
