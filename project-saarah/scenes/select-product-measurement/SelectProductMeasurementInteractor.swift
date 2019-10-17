//
//  SelectProductMeasurementInteractor.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol SelectProductMeasurementBusinessLogic {
	func fetchMeasurements(request: SelectProductMeasurement.FetchMeasurements.Request)
}

protocol SelectProductMeasurementDataStore {
    var measures: [Measure]? { get }
}

class SelectProductMeasurementInteractor: SelectProductMeasurementBusinessLogic, SelectProductMeasurementDataStore {

    var presenter: SelectProductMeasurementPresentationLogic?
    var measures: [Measure]?

    let measureWorker = MeasureWorker(measureService: MockMeasure())

	func fetchMeasurements(request: SelectProductMeasurement.FetchMeasurements.Request) {
        measureWorker.fetchMeasures { (measures) in
            self.measures = measures
            let response = SelectProductMeasurement.FetchMeasurements.Response(measures: measures)
            self.presenter?.presentMeasures(response: response)
        }
	}
}
