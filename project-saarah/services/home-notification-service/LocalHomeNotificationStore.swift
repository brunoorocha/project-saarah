//
//  LocalHomeNotificationStore.swift
//  project-saarah
//
//  Created by Bruno Rocha on 29/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class LocalHomeNotificationStore: HomeNotificationStoreProtocol {
    static var notifications: [HomeNotification] = [
        HomeNotification(emoji: "🚨", message: "O molho de tomate está quase vencendo", type: .alert),
        HomeNotification(emoji: "⚠️", message: "Você está quase sem pão bola", type: .warning),
        HomeNotification(emoji: "🎅🏻", message: "Jingle Bell! O Natal está quase chegando. Que tal revisar o estoque para ver se é necessário repor alguns items e atender os seus clientes sem surpresas.")
    ]

    func fetchNotifications(completionHandler: @escaping ([HomeNotification]) -> Void) {
        completionHandler(LocalHomeNotificationStore.notifications)
    }
}
