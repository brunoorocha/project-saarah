//
//  HomeViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    private let productItemCell: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        // This enables autolayout to view.
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupLayout()
    }
    
    private func setupLayout() {
        // Add subviews to view.
        view.addSubviews([productItemCell])
        
        // Constraints for productItemCell.
        NSLayoutConstraint.activate(
            [
                productItemCell.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
                productItemCell.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
                productItemCell.widthAnchor.constraint(equalToConstant: 343.0),
                productItemCell.heightAnchor.constraint(equalToConstant: 170)
            ]
        )
    }
}
