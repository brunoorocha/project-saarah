//
//  Item.swift
//  project-saarah
//
//  Created by Thiago Valente on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol Item {

    var name: String { get set }
    var price: Double { get set }
    var imagePath: String? { get set }

    /// Get the item information - Summary information
    ///
    /// - Returns: item information
    func information() -> String?

    /// Get average price spent by restaurant
    ///
    /// - Returns: average price
    func averagePrice() -> Double

}
