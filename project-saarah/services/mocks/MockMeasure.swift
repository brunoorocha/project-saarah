//
//  MockMeasure.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class MockMeasure: MeasureStoreProtocol {
    func fetchMeasures(_ completion: @escaping ([Measure]) -> Void) {
        let measure1 = Measure(id: "1", name: "Unidades", abbreviation: "und")
        let measure2 = Measure(id: "2", name: "Quilos", abbreviation: "kg")
        let measure3 = Measure(id: "3", name: "Gramas", abbreviation: "g")
        let measure4 = Measure(id: "4", name: "Miligramas", abbreviation: "mg")
        let measure5 = Measure(id: "5", name: "Litros", abbreviation: "l")
        let measure6 = Measure(id: "6", name: "Mililitros", abbreviation: "ml")

        DispatchQueue.main.async {
            completion([measure1, measure2, measure3,
                        measure4, measure5, measure6])
        }
    }
}
