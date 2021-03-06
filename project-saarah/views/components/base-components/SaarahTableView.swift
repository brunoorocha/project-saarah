//
//  SaarahTableView.swift
//  project-saarah
//
//  Created by Bruno Rocha on 27/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class SaarahTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        defaultTableConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        self.init(frame: .zero, style: .grouped)
    }

    private func defaultTableConfiguration () {
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = .none
        backgroundColor = AppStyleGuide.Colors.background.uiColor
    }
}
