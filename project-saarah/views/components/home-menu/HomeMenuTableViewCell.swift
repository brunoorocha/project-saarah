//
//  HomeMenuTableViewCell.swift
//  project-saarah
//
//  Created by Bruno Rocha on 28/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeMenuTableViewCell: UITableViewCell {
    private let homeMenuCollectionView = HomeMenuCollectionViewController()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        defaultCellConfiguration()
        configureCellComponents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func defaultCellConfiguration () {
        backgroundColor = .none
    }

    private func configureCellComponents () {
        contentView.addSubview(homeMenuCollectionView)

        homeMenuCollectionView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: contentView.trailingAnchor,
            padding: .zero   
        )
    }
}
