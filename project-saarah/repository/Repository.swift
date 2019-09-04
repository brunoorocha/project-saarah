//
//  Repository.swift
//  project-saarah
//
//  Created by Thiago Valente on 03/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation
import CoreData

enum Environment {
    case production
    case test

    var coreData: String {
        switch self {
        case .production:
            return "project_saarah"
        case .test:
            return "project_saarah_test"
        }
    }
}

protocol Repository {

    associatedtype RepositoryModel: NSManagedObject
    associatedtype ModelParameters

//    var environment: Environment { get set }
    var modelDao: CoreDao<RepositoryModel> { get set }

    func getAll() -> [RepositoryModel]
    func create(_ object: ModelParameters) -> RepositoryModel
    func create(_ object: RepositoryModel)
    func update(_ object: RepositoryModel)
    func delete(_ object: RepositoryModel)
    init(_ environment: Environment)
    init()

}

extension Repository {

    /// New NSManageObject
    ///
    /// - Returns: init from this object
    func new() -> RepositoryModel {
        return modelDao.new()
    }

    init(_ environment: Environment) {
        self.init()
        self.modelDao = CoreDao<RepositoryModel>(with: environment.coreData)
    }

}
