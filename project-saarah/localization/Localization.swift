//
//  Localization.swift
//  project-saarah
//
//  Created by Thiago Valente on 14/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

struct Localization: CustomStringConvertible {

    /// Will temporarily store the message to show in description
    var message: String

    /// Just call for enum case and the init will get the user language
    /// Note: Only the primary language will required all enums values
    /// If the the message in user language doesn't exists will get in primary language
    /// - Parameter string: enum case message
    init(_ string: AppStrings) {
        switch NSLocale.preferredLanguages[0] {
        default:
            self.message = string.pt_BR
        }
    }

    /// The protocol custom string convertible is required to use description (toString)
    public var description: String {
        return message
    }

}
