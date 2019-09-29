//
//  HomeMenuCollectionViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 28/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeMenuCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        defaultCollectionViewFlowLayoutConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func defaultCollectionViewFlowLayoutConfiguration () {
        scrollDirection = .vertical
        sectionInset = UIEdgeInsets(top: .zero, left: AppStyleGuide.Margins.medium.rawValue, bottom: .zero, right: AppStyleGuide.Margins.medium.rawValue)
        minimumLineSpacing = AppStyleGuide.Margins.medium.rawValue
        minimumInteritemSpacing = AppStyleGuide.Margins.medium.rawValue
    }
}

class HomeMenuCollectionView: UICollectionView {
    private let flowLayout = HomeMenuCollectionViewFlowLayout()

    private var cardSize: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return (screenWidth / 2) - 24
    }

    init() {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        defaultCollectionViewConfiguration()
        registerCells()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func defaultCollectionViewConfiguration () {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 208).isActive = true
        backgroundColor = .none
        setFlowLayoutItemSize()
    }

    private func registerCells () {
        register(HomeCardCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCardCollectionViewCell")
    }

    private func setFlowLayoutItemSize () {
        flowLayout.itemSize = CGSize(width: cardSize, height: 96)
    }

    func layoutDidChange () {
        setFlowLayoutItemSize()
    }
}
