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
        minimumLineSpacing = AppStyleGuide.Margins.medium.rawValue
        minimumInteritemSpacing = AppStyleGuide.Margins.medium.rawValue
    }
}

class HomeMenuCollectionViewController: UICollectionView {
    private let flowLayout = HomeMenuCollectionViewFlowLayout()

    init() {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        defaultCollectionViewConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func defaultCollectionViewConfiguration () {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 208).isActive = true
        backgroundColor = .none
    }
}
