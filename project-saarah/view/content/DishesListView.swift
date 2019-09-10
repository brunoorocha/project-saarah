//
//  DishesListView.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 10/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class DishesListView: UIView {
	var tableView: UITableView!
	
	var dishesViewModel: [DishViewModel] = []
	
	init() {
		super.init(frame: .zero)
		
		translatesAutoresizingMaskIntoConstraints = false
		
		instantiateViews()
		buildViewsHierarchy()
		setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func instantiateViews() {
		tableView = UITableView(frame: .zero, style: .plain)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = UIColor.white
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(DishTableViewCell.self, forCellReuseIdentifier: "DishTableViewCell")
	}
	
	func buildViewsHierarchy() {
		addSubview(tableView)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			tableView.topAnchor.constraint(equalTo: topAnchor),
			tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}

extension DishesListView: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dishesViewModel.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "DishTableViewCell", for: indexPath) as? DishTableViewCell else { return UITableViewCell() }
		
		let dishViewModel = dishesViewModel[indexPath.row]
		cell.dishViewModel = dishViewModel
		
		return cell
	}
}
