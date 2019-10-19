//
//  HomeNotificationWorker.swift
//  project-saarah
//
//  Created by Bruno Rocha on 19/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol HomeNotificationStoreProtocol {
    func fetchNotifications (completionHandler: @escaping ([HomeNotification]) -> Void)
}

class HomeNotificationsWorker {
    var notificationStore: HomeNotificationStoreProtocol

    init(notificationStore: HomeNotificationStoreProtocol) {
        self.notificationStore = notificationStore
    }

    func fetchNotifications (completionHandler: @escaping ([HomeNotification]) -> Void) {
        notificationStore.fetchNotifications { homeNotifications in
            DispatchQueue.main.async {
                completionHandler(homeNotifications)
            }
        }
    }

    func createNotification (_ notification: HomeNotification, completionHandler: @escaping (HomeNotification?) -> Void) {

    }
}
