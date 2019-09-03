//
//  CoreDao+Saarah.swift
//  project-saarah
//
//  Created by Thiago Valente on 03/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum CoreDataXCDataModelName: String {
    case production = "project_saarah"
    case test = "project_saarah_test"
}

extension CoreDao {
    convenience init(with nameContainer: CoreDataXCDataModelName = .production) {
        self.init(with: nameContainer.rawValue)
    }
}
