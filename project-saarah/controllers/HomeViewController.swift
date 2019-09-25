//
//  HomeViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    private let productItemView = UIView(backgroundColor: .red)
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantidade"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .natural
        
        return label
    }()
    
    private let validityLabel: UILabel = {
        let label = UILabel()
        label.text = "Validade"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .natural
        
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "Valor"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .natural
        
        return label
    }()
    
    private let addedOnDayLabel: UILabel = {
        let label = UILabel()
        label.text = "Adicionado no Dia"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .natural
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupLayout()
    }
    
    private func setupLayout() {
        // Add subview to view.
        view.addSubview(productItemView)
        
        // Add subviews to productItemCell.
        productItemView.addSubviews([amountLabel, validityLabel, valueLabel, addedOnDayLabel])
        
        // Constraints for productItemCell.
        productItemView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 343.0, height: 176.0)
        )
        
        // Contraints for amountLabel.
        amountLabel.anchor(
            top: productItemView.topAnchor,
            leading: productItemView.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 136.0, height: 24.0)
        )
        
        // Contraints for validityLabel.
        validityLabel.anchor(
            top: amountLabel.bottomAnchor,
            leading: productItemView.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 136.0, height: 24.0)
        )
        
        // Contraints for valueLabel.
        valueLabel.anchor(
            top: validityLabel.bottomAnchor,
            leading: productItemView.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 136.0, height: 24.0)
        )
        
        // Contraints for addedDayLabel.
        addedOnDayLabel.anchor(
            top: valueLabel.bottomAnchor,
            leading: productItemView.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 136.0, height: 24.0)
        )
    }
}
