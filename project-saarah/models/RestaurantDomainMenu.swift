//
//  RestaurantDomainMenu.swift
//  project-saarah
//
//  Created by Bruno Rocha on 04/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

enum RestaurantDomainMenu: CaseIterable, NavigationDrawerMenu {
    case estoque
    case cardapio

    var viewController: UIViewController {
        switch self {
        case .estoque:
            return InventoryMenuViewController()
        case .cardapio:
            return UIViewController()
        }
    }

    var name: String {
        switch self {
        case .estoque:
            return "Estoque"
        case .cardapio:
            return "Cardápio"
        }
    }
}
