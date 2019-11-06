//
//  TestCollectionViewController.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 06/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class TestCollectionViewController: UICollectionViewController {
    let testData = [
        TestData(
            image: AppStyleGuide.Icons.onboardingControl.uiImage!,
            description: "Mantenha o controle sobre os produtos do seu Restaurante ou Lanchonete."
        ),
        TestData(
            image: AppStyleGuide.Icons.onboardingControl.uiImage!,
            description: "Fique sabendo quando seus produtos estão próximos de vencer e evite desperdícios."
        ),
        TestData(
            image: AppStyleGuide.Icons.onboardingControl.uiImage!,
            description: "Monte o seu cardápio baseado nos produtos do estoque."
        ),
        TestData(
            image: AppStyleGuide.Icons.onboardingControl.uiImage!,
            description: "Acompanhe as entradas e saídas de produtos e pratos do seu negócio."
        )
    ]

    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Anterior", for: .normal)
        button.setTitleColor(AppStyleGuide.Colors.primary.uiColor, for: .normal)
        button.titleLabel?.font = AppStyleGuide.Typography.paragraph.uiFont
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)

        return button
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Próximo", for: .normal)
        button.setTitleColor(AppStyleGuide.Colors.primary.uiColor, for: .normal)
        button.titleLabel?.font = AppStyleGuide.Typography.paragraph.uiFont
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)

        return button
    }()

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = testData.count
        pageControl.currentPageIndicatorTintColor = AppStyleGuide.Colors.primary.uiColor
        pageControl.pageIndicatorTintColor = AppStyleGuide.Colors.mediumGray.uiColor

        return pageControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = AppStyleGuide.Colors.background.uiColor
        collectionView.isPagingEnabled = true
        collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        setupBottomControls()
    }
}

extension TestCollectionViewController {
    @objc private func handlePrevious() {
        let previousIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: previousIndex, section: 0)

        pageControl.currentPage = previousIndex

        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, testData.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)

        pageControl.currentPage = nextIndex

        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.distribution = .fillEqually

        // Add subview to main view.
        view.addSubview(bottomControlsStackView)

        // Constraints for bottomControlsStackView.
        bottomControlsStackView.anchor(
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor
        )

        // Constraint height for bottomControlsStackView.
        bottomControlsStackView.constraintHeight(48.0)
    }

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let currentTarget = targetContentOffset.pointee.x

        pageControl.currentPage = Int(currentTarget / view.frame.width)
    }
}

extension TestCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = testData[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TestCollectionViewCell

        cell.testData = data

        return cell
    }
}
