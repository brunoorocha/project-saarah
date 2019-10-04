//
//  UIView.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UIView {
    convenience public init(
        cornerRadius: CGFloat = 0.0,
        backgroundColor: UIColor = .clear
    ) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor

        // This enables cornerRadius to bounds of the class UIView.
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    convenience public init(corners: CACornerMask, cornerRadius: CGFloat) {
        self.init(frame: .zero)
        
        self.layer.maskedCorners = corners
        self.layer.cornerRadius = cornerRadius
        
        self.backgroundColor = .white
        
        // This enables cornerRadius to bounds of the class UIView.
        self.layer.masksToBounds = true
    }

    public struct AnchoredConstraints {
        var top: NSLayoutConstraint?
        var leading: NSLayoutConstraint?
        var bottom: NSLayoutConstraint?
        var trailing: NSLayoutConstraint?
        var width: NSLayoutConstraint?
        var height: NSLayoutConstraint?
    }

    public func addSubviews(_ views: [UIView]) {
        views.forEach { (view) in
            self.addSubview(view)
        }
    }

    @discardableResult
    public func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        padding: UIEdgeInsets = .zero,
        size: CGSize = .zero
    ) -> AnchoredConstraints {
        // This enables autolayout to class UIView.
        self.translatesAutoresizingMaskIntoConstraints = false

        var anchoredConstraints = AnchoredConstraints()

        if let topAnchor = top {
            anchoredConstraints.top = self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top)
        }

        if let leadingAnchor = leading {
            anchoredConstraints.leading = self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left)
        }

        if let bottomAnchor = bottom {
            anchoredConstraints.bottom = self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom)
        }

        if let trailingAnchor = trailing {
            anchoredConstraints.trailing = self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right)
        }

        if size.width != 0 {
            anchoredConstraints.width = self.widthAnchor.constraint(equalToConstant: size.width)
        }

        if size.height != 0 {
            anchoredConstraints.height = self.heightAnchor.constraint(equalToConstant: size.height)
        }

        [
            anchoredConstraints.top,
            anchoredConstraints.leading,
            anchoredConstraints.bottom,
            anchoredConstraints.trailing,
            anchoredConstraints.width,
            anchoredConstraints.height
        ].forEach { $0?.isActive = true }

        return anchoredConstraints
    }
    
    @discardableResult
    public func constraintWidth(_ constant: CGFloat) -> AnchoredConstraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.width = self.widthAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.width?.isActive = true
        
        return anchoredConstraints
    }
    
    @discardableResult
    public func constraintHeight(_ constant: CGFloat) -> AnchoredConstraints {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        var anchoredConstraints = AnchoredConstraints()
        anchoredConstraints.height = self.heightAnchor.constraint(equalToConstant: constant)
        anchoredConstraints.height?.isActive = true
        
        return anchoredConstraints
    }
}
