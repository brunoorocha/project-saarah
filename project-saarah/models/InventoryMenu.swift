//
//  InventoryMenu.swift
//  project-saarah
//
//  Created by Bruno Rocha on 04/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

enum InventoryMenu: NavigationDrawerMenu, CaseIterable {
    case all

    var viewController: UIViewController {
        switch self {
        case .all:
            return InventoryAllItemsViewController()
        }
    }

    var name: String {
        switch self {
        case .all:
            return "Todos os itens"
        }
    }
}
