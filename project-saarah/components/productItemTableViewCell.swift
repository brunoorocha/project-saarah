//
//  productItemTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductItemTableViewCell: UITableViewCell {
    private let backgroundCell = UIView(backgroundColor: .red)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
    }
    
    private func setupLayout() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
