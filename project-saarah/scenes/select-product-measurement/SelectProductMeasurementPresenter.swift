//
//  SelectProductMeasurementPresenter.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol SelectProductMeasurementPresentationLogic {
	func presentSomething(response: SelectProductMeasurement.Something.Response)
}

class SelectProductMeasurementPresenter: SelectProductMeasurementPresentationLogic {
	weak var viewController: SelectProductMeasurementDisplayLogic?

	// MARK: Do something
	func presentSomething(response: SelectProductMeasurement.Something.Response) {
//		let viewModel = SelectProductMeasurement.Something.ViewModel()
//		viewController?.displaySomething(viewModel: viewModel)
	}
}
