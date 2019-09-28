//
//  HomeMenuTableViewCell.swift
//  project-saarah
//
//  Created by Bruno Rocha on 28/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeMenuTableViewCell: UITableViewCell {
    private let homeMenuCollectionView = HomeMenuCollectionView()
    var homeMenuOptions = HomeMenuOption.allCases

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
        homeMenuCollectionView.delegate = self
        homeMenuCollectionView.dataSource = self
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

extension HomeMenuTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeMenuOptions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCardCollectionViewCell", for: indexPath) as? HomeCardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.cardTitle.text = homeMenuOptions[indexPath.row].title
        cell.cardIcon.image = homeMenuOptions[indexPath.row].icon.uiImage
        return cell
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        homeMenuCollectionView.layoutDidChange()
    }
}
