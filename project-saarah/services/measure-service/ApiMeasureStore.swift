//
//  MeasureStore.swift
//  project-saarah
//
//  Created by Bruno Rocha on 24/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class ApiMeasureStore: MeasureStoreProtocol {
    func fetchMeasures(_ completion: @escaping ([Measure]) -> Void) {
        let networkService = NetworkService()
        networkService.request(endpoint: ConeheadApiEndpoint.fetchMeasures) { (result: Result<[Measure]?, NetworkServiceError>) in
            switch result {
            case .success(let measures):
                guard let measures = measures else {
                    completion([])
                    return
                }

                completion(measures)
            case .failure(let error):
                print(error)
            }
        }
    }
}
