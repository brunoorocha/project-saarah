//
//  AddDishView.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 10/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class AddDishView: UIView {
	var navigationBar: UINavigationBar!
	var tableView: UITableView!
	
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
	
	@objc func cancelButtonAction() {
	}
	
	@objc func saveButtonAction() {
	}
	
	func instantiateViews() {
		navigationBar = UINavigationBar(frame: .zero)
		navigationBar.translatesAutoresizingMaskIntoConstraints = false
		let title = UINavigationItem(title: "Adicionar prato")
		navigationBar.setItems([title], animated: true)
		let cancelButton = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(cancelButtonAction))
		let saveButton = UIBarButtonItem(title: "Salvar", style: .done, target: self, action: #selector(saveButtonAction))
		navigationBar.topItem?.leftBarButtonItem = cancelButton
		navigationBar.topItem?.rightBarButtonItem = saveButton
		
		tableView = UITableView(frame: .zero, style: .plain)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = UIColor.white
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(FormTwoFieldsParallelTableViewCell.self, forCellReuseIdentifier: "FormTwoFieldsParallelTableViewCell")
		tableView.register(FormThreeFieldsParallelTableViewCell.self, forCellReuseIdentifier: "FormThreeFieldsParallelTableViewCell")
	}
	
	func buildViewsHierarchy() {
		addSubview(navigationBar)
		addSubview(tableView)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			navigationBar.leadingAnchor.constraint(equalTo: leadingAnchor),
			navigationBar.topAnchor.constraint(equalTo: topAnchor),
			navigationBar.trailingAnchor.constraint(equalTo: trailingAnchor),
			tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
			tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}

extension AddDishView: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return arrayFormData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		//need implement the method that says how the form has to be builded
		//implementation to show both cells
		let formData = arrayFormData[indexPath.row]
		
		switch (formData.cellType) {
		case 0:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "FormTwoFieldsParallelTableViewCell", for: indexPath) as? FormTwoFieldsParallelTableViewCell else { return UITableViewCell() }
			
			cell.setContent(formData)
			
			return cell
		case 1:
			guard let cell = tableView.dequeueReusableCell(withIdentifier: "FormThreeFieldsParallelTableViewCell", for: indexPath) as? FormThreeFieldsParallelTableViewCell else { return UITableViewCell() }
			
			cell.setContent(formData)
			
			return cell
		default:
			return UITableViewCell()
		}
	}
}
