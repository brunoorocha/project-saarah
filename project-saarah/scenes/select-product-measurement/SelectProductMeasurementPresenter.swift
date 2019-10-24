//
//  SelectProductMeasurementPresenter.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol SelectProductMeasurementPresentationLogic {
    func presentMeasures(response: SelectProductMeasurement.FetchMeasurements.Response)
}

class SelectProductMeasurementPresenter: SelectProductMeasurementPresentationLogic {
	weak var viewController: SelectProductMeasurementDisplayLogic?

	// MARK: Fetch Measures
    func presentMeasures(response: SelectProductMeasurement.FetchMeasurements.Response) {
        var displayMeasures: [SelectProductMeasurement.FetchMeasurements.ViewModel.DisplayMeasurement] = []
        for measure in response.measures {
            var selected: Bool = false
            if let selectedMeasure = response.selectedMeasure {
                selected = (measure === selectedMeasure)
            }
            let displayedMeasure = SelectProductMeasurement.FetchMeasurements.ViewModel.DisplayMeasurement(
                name: "\(measure.name)",
                selected: selected)
            displayMeasures.append(displayedMeasure)
        }
        let viewModel = SelectProductMeasurement.FetchMeasurements.ViewModel(displayMeasurements: displayMeasures)
        viewController?.displayFetchedMeasurements(viewModel: viewModel)
	}
}
