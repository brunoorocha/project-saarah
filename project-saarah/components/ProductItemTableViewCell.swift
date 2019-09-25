//
//  ProductItemTableViewCell.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class ProductItemTableViewCell: UITableViewCell {
    private let backgroundCell = UIView(cornerRadius: 8.0, backgroundColor: .white)
    
    private let amountLabel = UILabel(text: "Quantidade")
    private let validityLabel = UILabel(text: "Validade")
    private let valueLabel = UILabel(text: "Valor")
    private let addedOnDayLabel = UILabel(text: "Adicionado no Dia")
    
    private let numericAmountLabel = UILabel(text: "8 Kg", textColor: .lightGray)
    private let numericValidityLabel = UILabel(text: "01/10/2020", textColor: .lightGray)
    private let numericValueLabel = UILabel(text: "R$ 120,00", textColor: .lightGray)
    private let numericAddedOnDayLabel = UILabel(text: "01/10/2019", textColor: .lightGray)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
        setupLayout()
    }
    
    private func setupLayout() {
        // Add subview to cell.
        self.addSubview(backgroundCell)
        
        // Add subviews to backgroundCell.
        backgroundCell.addSubviews([amountLabel, validityLabel, valueLabel, addedOnDayLabel, numericAmountLabel, numericValidityLabel, numericValueLabel, numericAddedOnDayLabel])
        
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
        
        // Constraint for numericAmountLabel.
        numericAmountLabel.anchor(
            top: backgroundCell.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: backgroundCell.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 0.0, bottom: 0.0, right: 16.0),
            size: CGSize(width: 88.0, height: 24.0)
        )
        
        // Constraint for numericValidityLabel.
        numericValidityLabel.anchor(
            top: numericAmountLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: backgroundCell.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 0.0, bottom: 0.0, right: 16.0),
            size: CGSize(width: 88.0, height: 24.0)
        )
        
        // Constraint for numericValueLabel.
        numericValueLabel.anchor(
            top: numericValidityLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: backgroundCell.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 0.0, bottom: 0.0, right: 16.0),
            size: CGSize(width: 88.0, height: 24.0)
        )
        
        // Constraint for numericValidityLabel.
        numericAddedOnDayLabel.anchor(
            top: numericValueLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: backgroundCell.trailingAnchor,
            padding: UIEdgeInsets(top: 16.0, left: 0.0, bottom: 0.0, right: 16.0),
            size: CGSize(width: 88.0, height: 24.0)
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder aDecoder: ) has not been implemented.")
    }
}
