//
//  BarcodeView.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class BarcodeView: UIView {

    var topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var contentBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .none
        return view
    }()
    var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

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
        searchCode()
    }

    func buildViewsHierarchy() {
        addSubviews([topView, contentBarView, bottomView])
        contentBarView.addSubview(lineView)
    }

    func setupConstraints() {
        let xLargeMargin = AppStyleGuide.Margins.xlarge.rawValue

        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35),

            contentBarView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            contentBarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBarView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBarView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),

            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35),

            lineView.centerYAnchor.constraint(equalTo: contentBarView.centerYAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 5),
            lineView.leadingAnchor.constraint(equalTo: contentBarView.leadingAnchor, constant: xLargeMargin),
            lineView.trailingAnchor.constraint(equalTo: contentBarView.trailingAnchor, constant: -xLargeMargin)
        ])
    }

    func searchCode() {
        lineView.backgroundColor = UIColor.rgba(66, 66, 66)
    }

    func foundCode() {
        lineView.backgroundColor = UIColor.rgba(72, 184, 48)
    }

    func errorCode() {
        lineView.backgroundColor = UIColor.rgba(224, 48, 48)
    }
}
