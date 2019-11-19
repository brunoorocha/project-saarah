//
//  BarcodeView.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class BarcodeView: UIView {
//
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let smallMargin = AppStyleGuide.Margins.small.rawValue
    let mediumMargin = AppStyleGuide.Margins.medium.rawValue

    let addProductView = SaarahView()
    let addProductActionView = SaarahView()

    init() {
        super.init(frame: .zero)

        backgroundColor = UIColor.white

        instantiateViews()
        buildViewsHierarchy()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func instantiateViews() {
    }

    func buildViewsHierarchy() {
        addSubview(imageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func presentUndefinedProductViews() {
        if addProductActionView.superview != nil { return }
        showUndefinedProductView()
    }

   private func showUndefinedProductView() {
        addSubview(addProductActionView)

        let addIconImageView = SaarahIconImageView(image: AppStyleGuide.Icons.plus.uiImage)
        let buttonLabel = SaarahButton()
        buttonLabel.setTitle(Localization(.buttonTableViewCell(.title)).description, for: .normal)
        buttonLabel.contentHorizontalAlignment = .left

        addProductActionView.addSubviews([addIconImageView, buttonLabel])
        buttonLabel.isUserInteractionEnabled = false

        NSLayoutConstraint.activate([
            addProductActionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: mediumMargin),
            addProductActionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -mediumMargin),
            addProductActionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -mediumMargin),

            addIconImageView.topAnchor.constraint(equalTo: addProductActionView.topAnchor, constant: mediumMargin),
            addIconImageView.bottomAnchor.constraint(equalTo: addProductActionView.bottomAnchor, constant: -mediumMargin),
            addIconImageView.trailingAnchor.constraint(equalTo: buttonLabel.leadingAnchor, constant: -smallMargin),

            buttonLabel.topAnchor.constraint(equalTo: addProductActionView.topAnchor, constant: mediumMargin),
            buttonLabel.bottomAnchor.constraint(equalTo: addProductActionView.bottomAnchor, constant: -mediumMargin),
            buttonLabel.centerXAnchor.constraint(equalTo: addProductActionView.centerXAnchor, constant: (addIconImageView.frame.width - mediumMargin))
        ])

        showUndefinedProductMessage()
    }

    private func showUndefinedProductMessage() {
        addSubview(addProductView)

        let title = Heading3Label()
        title.text = Localization(.barcodeScene(.view(.notFound(.product)))).description
        let overview = ParagraphLabel()
        overview.text = Localization(.barcodeScene(.view(.notFound(.overview)))).description

        addProductView.addSubviews([title, overview])

        NSLayoutConstraint.activate([
            addProductView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: mediumMargin),
            addProductView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -mediumMargin),
            addProductView.bottomAnchor.constraint(equalTo: addProductActionView.topAnchor, constant: -mediumMargin),

            title.topAnchor.constraint(equalTo: addProductView.topAnchor, constant: mediumMargin),
            title.leadingAnchor.constraint(equalTo: addProductView.leadingAnchor, constant: mediumMargin),
            title.trailingAnchor.constraint(equalTo: addProductView.trailingAnchor, constant: -mediumMargin),

            overview.topAnchor.constraint(equalTo: title.bottomAnchor, constant: smallMargin),
            overview.leadingAnchor.constraint(equalTo: addProductView.leadingAnchor, constant: mediumMargin),
            overview.trailingAnchor.constraint(equalTo: addProductView.trailingAnchor, constant: -mediumMargin),
            overview.bottomAnchor.constraint(equalTo: addProductView.bottomAnchor, constant: -mediumMargin)
        ])
    }
}
