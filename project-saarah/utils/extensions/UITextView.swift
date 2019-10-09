//
//  UITextView.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 09/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UITextView {
    public func setupProductDetailsWith(
        numberInStock: Int,
        numberOfProductItem: Int,
        measurementUnit: String
    ) {
        self.backgroundColor = .clear
        
        let attributedText = NSMutableAttributedString(
            string: "\(numberInStock)",
            attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16.0),
                NSAttributedString.Key.foregroundColor: UIColor.title
            ]
        )
        
        attributedText.append(
            NSAttributedString(
                string: " / \(numberOfProductItem) (\(measurementUnit))",
                attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12.0),
                    NSAttributedString.Key.foregroundColor: UIColor.subtitle
                ]
            )
        )
        
        self.attributedText = attributedText
        self.textContainerInset = UIEdgeInsets(
            top: 2.0,
            left: 0.0,
            bottom: 0.0,
            right: 0.0
        )
        
        self.textAlignment = .right
        
        self.isEditable = false
        self.isSelectable = false
        self.isScrollEnabled = false
    }
}
