//
//  HomeVIewViewModel.swift
//  project-saarah
//
//  Created by Bruno Rocha on 07/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol HomeViewViewModelProtocol {
    var menuOptions: [HomeMenuOption] { get set }
    var notifications: [Home.FetchHomeNotifications.ViewModel.DisplayedHomeNotification] { get set }
}

class HomeViewDefaultViewModel: HomeViewViewModelProtocol {
    var menuOptions: [HomeMenuOption] = []
    var notifications: [Home.FetchHomeNotifications.ViewModel.DisplayedHomeNotification] = []
}
