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
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        
        //This enables autolayout to label.
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let validityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        
        // This enables autolayout to label.
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        
        // This enables autolayout to label.
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let addedDayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        
        // This enables autolayout to label.
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupLayout()
    }
    
    private func setupLayout() {
        // Add subview to view.
        view.addSubview(productItemCell)
        
        // Add subviews to productItemCell.
        productItemCell.addSubviews([addedDayLabel, valueLabel, validityLabel, amountLabel])
        
        // Constraints for productItemCell.
        NSLayoutConstraint.activate(
            [
                productItemCell.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
                productItemCell.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
                productItemCell.widthAnchor.constraint(equalToConstant: 343.0),
                productItemCell.heightAnchor.constraint(equalToConstant: 176)
            ]
        )
        
        // Contraints for amountLabel.
        NSLayoutConstraint.activate(
            [
                addedDayLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 16.0),
                addedDayLabel.leadingAnchor.constraint(equalTo: productItemCell.leadingAnchor, constant: 16.0),
                addedDayLabel.widthAnchor.constraint(equalToConstant: 120.0),
                addedDayLabel.heightAnchor.constraint(equalToConstant: 24.0),
                
                valueLabel.topAnchor.constraint(equalTo: validityLabel.bottomAnchor, constant: 16.0),
                valueLabel.leadingAnchor.constraint(equalTo: productItemCell.leadingAnchor, constant: 16.0),
                valueLabel.widthAnchor.constraint(equalToConstant: 120.0),
                valueLabel.heightAnchor.constraint(equalToConstant: 24.0),
                
                validityLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 16.0),
                validityLabel.leadingAnchor.constraint(equalTo: productItemCell.leadingAnchor, constant: 16.0),
                validityLabel.widthAnchor.constraint(equalToConstant: 120.0),
                validityLabel.heightAnchor.constraint(equalToConstant: 24.0),
                
                amountLabel.topAnchor.constraint(equalTo: productItemCell.topAnchor, constant: 16.0),
                amountLabel.leadingAnchor.constraint(equalTo: productItemCell.leadingAnchor, constant: 16.0),
                amountLabel.widthAnchor.constraint(equalToConstant: 120.0),
                amountLabel.heightAnchor.constraint(equalToConstant: 24.0)
            ]
        )
    }
}
