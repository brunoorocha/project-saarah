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
        guard let url = URL(string: "https://conehead-api.herokuapp.com/api/v1/notifications") else { return }

        let endpoint = Endpoint(url: url)
        let networkService = NetworkService()
        networkService.request(endpoint: endpoint) { (result) in
            switch result {
            case .success(let data):
                print(String(data: data!, encoding: .utf8) ?? "")

            case .failure(let error):
                print(error)

            }
        }

    }
}
