//
//  Repository.swift
//  project-saarah
//
//  Created by Thiago Valente on 03/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation
import CoreData

protocol Repository {

    associatedtype RepositoryModel: NSManagedObject
    var modelDao: CoreDao<RepositoryModel> { get }

    func getAll() -> [RepositoryModel]
    func create(_ object: RepositoryModel)
    func update(_ object: RepositoryModel)
    func delete(_ object: RepositoryModel)

}

extension Repository {

    /// New NSManageObject
    ///
    /// - Returns: init from this object
    func new() -> RepositoryModel {
        return modelDao.new()
    }

}
