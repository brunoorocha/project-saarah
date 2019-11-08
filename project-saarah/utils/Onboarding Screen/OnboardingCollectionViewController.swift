//
//  OnboardingCollectionViewController.swift
//  project-saarah
//
//  Created by Marcus Vinícius on 08/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class OnboardingCollectionViewController: UICollectionViewController {
    let onboardingData = [
        OnboardingDataModel(
            image: AppStyleGuide.Icons.onboardingControl.uiImage!,
            description: "\(Localization(.onboarding(.description(.first))))"
        ),
        OnboardingDataModel(
            image: AppStyleGuide.Icons.onboardingMenu.uiImage!,
            description: "\(Localization(.onboarding(.description(.second))))"
        ),
        OnboardingDataModel(
            image: AppStyleGuide.Icons.onboardingMoney.uiImage!,
            description: "\(Localization(.onboarding(.description(.third))))"
        )
    ]

    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("\(Localization(.onboarding(.before)))", for: .normal)
        button.setTitleColor(AppStyleGuide.Colors.background.uiColor, for: .normal)
        button.titleLabel?.font = AppStyleGuide.Typography.paragraph.uiFont
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)

        return button
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("\(Localization(.onboarding(.next)))", for: .normal)
        button.setTitleColor(AppStyleGuide.Colors.primary.uiColor, for: .normal)
        button.titleLabel?.font = AppStyleGuide.Typography.paragraph.uiFont
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)

        return button
    }()

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = onboardingData.count
        pageControl.currentPageIndicatorTintColor = AppStyleGuide.Colors.primary.uiColor
        pageControl.pageIndicatorTintColor = AppStyleGuide.Colors.mediumGray.uiColor

        return pageControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = AppStyleGuide.Colors.background.uiColor
        collectionView.isPagingEnabled = true
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.showsHorizontalScrollIndicator = false

        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .touchUpInside)

        setupBottomControls()
    }

    func changePage(by page: Int) {
        if page == 0 {
            previousButton.setTitleColor(AppStyleGuide.Colors.background.uiColor, for: .normal)
        } else {
            previousButton.setTitleColor(AppStyleGuide.Colors.primary.uiColor, for: .normal)
        }
        pageControl.currentPage = page

        let indexPath = IndexPath(item: page, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension OnboardingCollectionViewController {
    @objc func pageControlTapped(_ sender: Any) {
        guard let pageControl = sender as? UIPageControl else { return }
        changePage(by: pageControl.currentPage)
    }

    @objc private func handlePrevious() {
        let previousIndex = max(pageControl.currentPage - 1, 0)
        changePage(by: previousIndex)
    }

    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, onboardingData.count - 1)
        changePage(by: nextIndex)
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

        changePage(by: Int(currentTarget / view.frame.width))
    }
}

extension OnboardingCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = onboardingData[indexPath.item]

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }

        cell.onboardingDataModel = data

        return cell
    }
}
