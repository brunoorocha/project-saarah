//
//  Label.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 09/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class Label: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .white
        
        font = UIFont.boldSystemFont(ofSize: 16.0)
        
        textAlignment = .center
        
        backgroundColor = .red
        
        layer.masksToBounds = true
        layer.cornerRadius = 8.0
        
        // This enables autolayout to class.
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
