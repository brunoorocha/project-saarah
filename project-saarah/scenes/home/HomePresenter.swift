//
//  HomePresenter.swift
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

protocol HomePresentationLogic {
    func presentHomeNotifications (response: Home.FetchHomeNotifications.Response)
}

class HomePresenter: HomePresentationLogic {
	weak var viewController: HomeDisplayLogic?

    func presentHomeNotifications(response: Home.FetchHomeNotifications.Response) {
        var displayedHomeNotifications: [Home.FetchHomeNotifications.ViewModel.DisplayedHomeNotification] = []
        response.notifications.forEach { homeNotification in
            let displayedHomeNotification = Home.FetchHomeNotifications.ViewModel.DisplayedHomeNotification(emoji: homeNotification.emoji, message: homeNotification.message, type: homeNotification.type) // swiftlint:disable:this line_length
            displayedHomeNotifications.append(displayedHomeNotification)
        }

        let viewModel = Home.FetchHomeNotifications.ViewModel(displayedHomeNotifications: displayedHomeNotifications)
        viewController?.displayHomeNotifications(viewModel: viewModel)
    }
}
