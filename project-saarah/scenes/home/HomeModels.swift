//
//  HomeModels.swift
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

enum Home {
	// MARK: Use cases
	enum Something {
		struct Request {
		}
		struct Response {
		}
		struct ViewModel {
		}
	}

    enum FetchHomeNotifications {
        struct Request {

        }

        struct Response {
            var notifications: [HomeNotification]
        }

        struct ViewModel {
            var displayedHomeNotifications: [DisplayedHomeNotification]

            struct DisplayedHomeNotification {
                var emoji: String
                var message: String
                var type: HomeNotificationType
            }
        }
    }
}
