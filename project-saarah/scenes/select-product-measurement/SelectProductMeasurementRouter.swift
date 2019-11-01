//
//  SelectProductMeasurementRouter.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SelectProductMeasurementRoutingLogic {
    func routeToNewProduct()
}

protocol SelectProductMeasurementDataPassing {
	var dataStore: SelectProductMeasurementDataStore? { get }
    var selectMeasureDataStore: SelectedMeasureReceptor? { get set }
}

protocol SelectedMeasureReceptor {
    var measureReceptor: Measure? { get set }
}

class SelectProductMeasurementRouter: NSObject, SelectProductMeasurementRoutingLogic, SelectProductMeasurementDataPassing {

    weak var viewController: SelectProductMeasurementViewController?
    var dataStore: SelectProductMeasurementDataStore?
    var selectMeasureDataStore: SelectedMeasureReceptor?

    // MARK: Routing
    func routeToNewProduct() {
        guard var destinationDataStore = selectMeasureDataStore else { return }

        guard let dataStore = dataStore else { return }

        passDataToAddNewProduct(source: dataStore, destination: &destinationDataStore)
        navigateBack()
    }

    // MARK: Passing data
    func passDataToAddNewProduct(source: SelectProductMeasurementDataStore, destination: inout SelectedMeasureReceptor) {
        guard let measure = source.selectedMeasure else { return }
        destination.measureReceptor = measure
    }

    func navigateBack() {
        guard let viewController = viewController else { return }
        viewController.dismiss(animated: true)
    }
}
