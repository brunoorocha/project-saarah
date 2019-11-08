//
//  UIViewController+ShowActivityIndicator.swift
//  project-saarah
//
//  Created by Bruno Rocha on 08/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UIViewController {
    func showFullScreenActivityIndicator () {
        guard let view = view else { return }
        let fullScreenActivityIndicator = FullScreenActivityIndicator(frame: view.frame)
        fullScreenActivityIndicator.center = view.center
        view.addSubview(fullScreenActivityIndicator)

        NSLayoutConstraint.activate([
            fullScreenActivityIndicator.topAnchor.constraint(equalTo: view.topAnchor),
            fullScreenActivityIndicator.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fullScreenActivityIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullScreenActivityIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        fullScreenActivityIndicator.show(animated: true) 
    }

    func hideFullScreenActivityIndicator () {
        guard let view = view else { return }
        view.subviews.forEach { view in
            if let view = view as? FullScreenActivityIndicator {
                view.hide(animated: true) {
                    view.removeFromSuperview()
                }
            }
        }
    }
}
