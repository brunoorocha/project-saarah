//
//  ApiHomeNotificationStore.swift
//  project-saarah
//
//  Created by Bruno Rocha on 18/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class ApiHomeNotificationStore: HomeNotificationStoreProtocol {
    func fetchNotifications(completionHandler: @escaping ([HomeNotification]) -> Void) {
        let networkService = NetworkService()
        networkService.request(endpoint: ConeheadApiEndpoint.fetchNotifications) { (result) in
            switch result {
            case .success(let data):
                print(String(data: data!, encoding: .utf8) ?? "")

            case .failure(let error):
                print(error)

            }
        }

    }
}
