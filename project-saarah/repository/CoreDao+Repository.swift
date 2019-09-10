//
//  CoreDao+Repository.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

extension Repository {
    func getDaoAll() -> [RepositoryModel] {
        return modelDao.fetchAll()
    }

    func createDao(_ object: RepositoryModel) {
        modelDao.insert(object: object)
    }

    func updateDao(_ object: RepositoryModel) {
        modelDao.save()
    }

    func deleteDao(_ object: RepositoryModel) {
        modelDao.delete(object: object)
    }
}
