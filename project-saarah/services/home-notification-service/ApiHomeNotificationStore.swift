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
        networkService.request(endpoint: ConeheadApiEndpoint.fetchNotifications) { (result: Result<[HomeNotification]?, NetworkServiceError>) in
            switch result {
            case .success(let notifications):
                guard let notifications = notifications else {
                    completionHandler([])
                    return
                }

                completionHandler(notifications)
            case .failure(let error):
                print(error)
            }
        }

    }
}
