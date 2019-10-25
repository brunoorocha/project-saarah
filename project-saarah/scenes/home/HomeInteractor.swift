//
//  HomeInteractor.swift
//  project-saarah
//
//  Created by Bruno Rocha on 29/09/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic {
    func fetchHomeNotifications (request: Home.FetchHomeNotifications.Request)
}

protocol HomeDataStore {
    var homeNotifications: [HomeNotification]? { get }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var homeNotifications: [HomeNotification]?

	var presenter: HomePresentationLogic?
    var homeNotificationWorker = HomeNotificationsWorker(notificationStore: ApiHomeNotificationStore())

    func fetchHomeNotifications (request: Home.FetchHomeNotifications.Request) {
        homeNotificationWorker.fetchNotifications { notifications in
            self.homeNotifications = notifications
            let response = Home.FetchHomeNotifications.Response(notifications: notifications)
            self.presenter?.presentHomeNotifications(response: response)
        }
    }
}
