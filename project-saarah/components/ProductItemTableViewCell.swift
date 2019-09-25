//
//  ProductItemTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductItemTableViewCell: UITableViewCell {
    private let backgroundCell = UIView(cornerRadius: 8.0)
    
    private let amountLabel = UILabel(text: "Quantidade")
    private let validityLabel = UILabel(text: "Validade")
    private let valueLabel = UILabel(text: "Valor")
    private let addedOnDayLabel = UILabel(text: "Adicionado no Dia")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
        setupLayout()
    }
    
    private func setupLayout() {
        // Add subview to cell.
        self.addSubview(backgroundCell)
        
        // Add subviews to backgroundCell.
        backgroundCell.addSubviews([amountLabel, validityLabel, valueLabel, addedOnDayLabel])
        
        // Constraint for backgroundCell.
        backgroundCell.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 343.0, height: 176.0)
        )
        
        // Constraint for amountLabel.
        amountLabel.anchor(
            top: backgroundCell.topAnchor,
            leading: backgroundCell.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 136.0, height: 24.0)
        )
        
        // Constraint for validityLabel.
        validityLabel.anchor(
            top: amountLabel.bottomAnchor,
            leading: backgroundCell.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 136.0, height: 24.0)
        )
        
        // Constraint for valueLabel.
        valueLabel.anchor(
            top: validityLabel.bottomAnchor,
            leading: backgroundCell.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 136.0, height: 24.0)
        )
        
        // Constraint for addedOnDayLabel.
        addedOnDayLabel.anchor(
            top: valueLabel.bottomAnchor,
            leading: backgroundCell.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 16.0, left: 16.0, bottom: 0.0, right: 0.0),
            size: CGSize(width: 136.0, height: 24.0)
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
