//
//  HomeMenuDataSource.swift
//  project-saarah
//
//  Created by Bruno Rocha on 21/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeMenuCollectionViewDataSource: NSObject {
    var menuOptions = HomeMenuOption.allCases

    func cell (for collectionView: UICollectionView, in indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionView = collectionView as? HomeMenuCollectionView,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionView.cellIdentifier, for: indexPath) as? HomeCardCollectionViewCell else {
            return UICollectionViewCell()
        }

        let homeMenuOption = menuOptions[indexPath.row]
        cell.cardTitle.text = homeMenuOption.title
        cell.cardIcon.image = homeMenuOption.icon.uiImage
        cell.highlightedColor = homeMenuOption.highlightedColor
        return cell
    }
}

extension HomeMenuCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuOptions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cell(for: collectionView, in: indexPath)
    }
}
