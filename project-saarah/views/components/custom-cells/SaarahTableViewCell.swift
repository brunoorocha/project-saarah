//
//  SaarahTableViewCell.swift
//  project-saarah
//
//  Created by Bruno Rocha on 25/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahTableViewCell: UITableViewCell {
    let cellContentView = UIView(backgroundColor: AppStyleGuide.Colors.foreground.uiColor)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCellComponents()
        defaultConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func defaultConfiguration () {
        selectionStyle = .none
        contentView.backgroundColor = AppStyleGuide.Colors.background.uiColor
        contentView.addSubview(cellContentView)
        let margin = AppStyleGuide.Margins.medium.rawValue
        
        cellContentView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        )
    }

    func configureCellComponents () {}
}
