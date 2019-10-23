//
//  HomeMenuCollectionViewDataSource.swift
//  project-saarah
//
//  Created by Bruno Rocha on 21/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeMenuCollectionViewDataSource: NSObject {
    var menuOptions = [HomeMenuOption.inventory]
}

extension HomeMenuCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuOptions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionView = collectionView as? HomeMenuCollectionView,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionView.cellIdentifier, for: indexPath) as? HomeCardCollectionViewCell else { return UICollectionViewCell() }
        let menuOption = menuOptions[indexPath.row]
        cell.cardTitle.text = menuOption.title
        cell.highlightedColor = menuOption.highlightedColor
        cell.cardIcon.image = menuOption.icon.uiImage
        return cell
    }
}
