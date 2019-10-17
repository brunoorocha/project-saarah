//
//  SelectProductMeasurementRouter.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SelectProductMeasurementRoutingLogic {
    func routeToNewProduct(row: Int)
}

protocol SelectProductMeasurementDataPassing {
	var dataStore: SelectProductMeasurementDataStore? { get }
}

class SelectProductMeasurementRouter: NSObject, SelectProductMeasurementRoutingLogic, SelectProductMeasurementDataPassing {

    weak var viewController: SelectProductMeasurementViewController?
    var dataStore: SelectProductMeasurementDataStore?

    // MARK: Routing
    func routeToNewProduct(row: Int) {
        // TODO: Send back the dataStore
        guard let dataStore = dataStore else { return }
        guard let measures = dataStore.measures else { return }
        print(measures[row])
    }
}
