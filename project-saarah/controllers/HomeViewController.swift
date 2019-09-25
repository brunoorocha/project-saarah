//
//  HomeViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    private let productItemCell = UIView(backgroundColor: .red)
    private let amountLabel = UILabel(backgroundColor: .green)
    private let validityLabel = UILabel(backgroundColor: .green)
    private let valueLabel = UILabel(backgroundColor: .green)
    private let addedDayLabel = UILabel(backgroundColor: .green)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupLayout()
    }
    
    private func setupLayout() {
        // Add subview to view.
        view.addSubview(productItemCell)
        
        // Add subviews to productItemCell.
        productItemCell.addSubviews([amountLabel, validityLabel, valueLabel, addedDayLabel])
        
        // Constraints for productItemCell.
        productItemCell.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 343.0, height: 176.0)
        )
        
        // Contraints for amountLabel.
        amountLabel.anchor(
            top: productItemCell.topAnchor,
            leading: productItemCell.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 120.0, height: 24.0)
        )
        
        // Contraints for validityLabel.
        validityLabel.anchor(
            top: amountLabel.bottomAnchor,
            leading: productItemCell.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 120.0, height: 24.0)
        )
        
        // Contraints for valueLabel.
        valueLabel.anchor(
            top: validityLabel.bottomAnchor,
            leading: productItemCell.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 120.0, height: 24.0)
        )
        
        // Contraints for addedDayLabel.
        addedDayLabel.anchor(
            top: valueLabel.bottomAnchor,
            leading: productItemCell.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 120.0, height: 24.0)
        )
    }
}
