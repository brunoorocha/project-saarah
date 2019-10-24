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
    func selectMeasure(withName name: String)
}

protocol SelectProductMeasurementDataStore {
    var measures: [Measure]? { get }
    var selectedMeasure: Measure? { get set }
}

class SelectProductMeasurementInteractor: SelectProductMeasurementBusinessLogic, SelectProductMeasurementDataStore {

    var presenter: SelectProductMeasurementPresentationLogic?
    var measures: [Measure]?
    var selectedMeasure: Measure?

    let measureWorker = MeasureWorker(measureService: ApiMeasureStore())

    // Used to check in controller
    private var selectedByName: String?

	func fetchMeasurements(request: SelectProductMeasurement.FetchMeasurements.Request) {
        measureWorker.fetchMeasures { (measures) in
            self.measures = measures
            self.selectMeasure()
            let response = SelectProductMeasurement.FetchMeasurements.Response(measures: measures, selectedMeasure: self.selectedMeasure)
            self.presenter?.presentMeasures(response: response)
        }
	}

    func selectedMeasure(request: SelectProductMeasurement.ChoosedMeasure.Request) {
        guard let measures = measures else { return }
        if measures.count < request.row { return }
        selectedMeasure = measures[request.row]
    }

    /// Storage the selected measure to select after fetch
    /// - Parameter name: name of the measure
    func selectMeasure(withName name: String) {
        selectedByName = name
    }

    /// Select the measure by the selectedByName
    private func selectMeasure() {
        selectedMeasure = measures?.first(where: { $0.name == selectedByName })
    }
}
