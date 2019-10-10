//
//  HomeNotification.swift
//  project-saarah
//
//  Created by Bruno Rocha on 29/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum HomeNotificationType {
    case alert
    case warning
    case normal
}

struct HomeNotification {
    var emoji: String
    var message: String
    var type: HomeNotificationType = .normal
}
