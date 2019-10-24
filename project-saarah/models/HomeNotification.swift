//
//  HomeNotification.swift
//  project-saarah
//
//  Created by Bruno Rocha on 29/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum HomeNotificationType: String {
    case alert
    case warning
    case normal
}

struct HomeNotification {
    var emoji: String
    var message: String
    var type: HomeNotificationType = .normal
}

extension HomeNotification: Decodable {
    enum CodingKeys: CodingKey {
        case emoji
        case message
        case type
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        emoji = try values.decode(String.self, forKey: .emoji)
        message = try values.decode(String.self, forKey: .message)
        let decodedType = try values.decode(String.self, forKey: .type)
        self.type = HomeNotificationType(rawValue: decodedType) ?? .normal
    }
}
