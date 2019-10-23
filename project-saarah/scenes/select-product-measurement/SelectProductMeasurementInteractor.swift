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
    func selectedMeasure(request: SelectProductMeasurement.ChoosedMeasure.Request)
}

protocol SelectProductMeasurementDataStore {
    var measures: [Measure]? { get }
    var selectedMeasure: Measure? { get set }
}

class SelectProductMeasurementInteractor: SelectProductMeasurementBusinessLogic, SelectProductMeasurementDataStore {

    var presenter: SelectProductMeasurementPresentationLogic?
    var measures: [Measure]?
    var selectedMeasure: Measure?

    let measureWorker = MeasureWorker(measureService: MockMeasure())

	func fetchMeasurements(request: SelectProductMeasurement.FetchMeasurements.Request) {
        measureWorker.fetchMeasures { (measures) in
            self.measures = measures
            let response = SelectProductMeasurement.FetchMeasurements.Response(measures: measures)
            self.presenter?.presentMeasures(response: response)
        }
	}
    
    func selectedMeasure(request: SelectProductMeasurement.ChoosedMeasure.Request) {
        guard let measures = measures else { return }
        if measures.count < request.row { return }
        selectedMeasure = measures[request.row]
    }
}
