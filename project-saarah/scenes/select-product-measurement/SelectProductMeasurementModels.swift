//
//  SelectProductMeasurementModels.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum SelectProductMeasurement {
	// MARK: Fetch Measurements
	enum FetchMeasurements {
		struct Request {
		}
		struct Response {
            var measures: [Measure]
            var selectedMeasure: Measure?
		}
		struct ViewModel {
			struct DisplayMeasurement {
                var name: String
                var selected: Bool
			}
			var displayMeasurements: [DisplayMeasurement]
		}
	}
    // MARK: Choosed Measure
    enum ChoosedMeasure {
        struct Request {
            var row: Int
        }
    }
    // MARK: Select Measure
    enum SelectMeasure {
        struct Request {
            var name: String
        }
    }
}
