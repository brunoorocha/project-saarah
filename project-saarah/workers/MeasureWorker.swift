//
//  MeasureWorker.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol MeasureStoreProtocol {
    func fetchMeasures(_ completion: @escaping ([Measure]) -> Void)
}

class MeasureWorker {
    let measureService: MeasureStoreProtocol

    init(measureService: MeasureStoreProtocol) {
        self.measureService = measureService
    }

    func fetchMeasures(_ completion: @escaping ([Measure]) -> Void) {
        measureService.fetchMeasures { (measures) in
            DispatchQueue.main.async {
                completion(measures)
            }
        }
    }
}
