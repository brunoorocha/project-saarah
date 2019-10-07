//
//  Teste.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class Teste {
	var viewModel: ProductDetail.GetProduct.ViewModel?
	
	func resgisterCells(for tableView: UITableView) {
		tableView.register(LabeledTableViewCell.self, forCellReuseIdentifier: "LabeledTableViewCell")
		tableView.register(DefaultCellTableViewCell.self, forCellReuseIdentifier: "DefaultCellTableViewCell")
		tableView.register(ProductActivityTableViewCell.self, forCellReuseIdentifier: "ProductActivityTableViewCell")
	}
	
	func reuseIdentifier(for section: Int) -> String {
		switch (section) {
		case 0:
			return "LabeledTableViewCell"
		case 1:
			return "DefaultCellTableViewCell"
		case 2:
			return "ProductActivityTableViewCell"
		default:
			return ""
		}
	}
	
	func numberOfSections() -> Int {
		return 3
	}
	
	func numberOfRows(in section: Int) -> Int {
		if let viewModel = viewModel {
			switch (section) {
			case 0:
				return 2
			case 1:
				return 1
			case 2:
				return viewModel.logsViewModels.count
			default:
				return 0
			}
		}
		
		return 0
	}
	
	func viewForHeader(in section: Int) -> UIView {
		switch (section) {
		case 0:
			let headerView = DefaultSectionHeaderView()
			headerView.titleLabel.text = "INFORMAÇÕES BÁSICAS"
			headerView.rightButton.isHidden = true
			return headerView
		case 1:
			return EmptySectionHeaderView()
		case 2:
			let headerView = DefaultSectionHeaderView()
			headerView.titleLabel.text = "ATIVIDADE"
			headerView.rightButton.setTitle("VER TODAS", for: .normal)
			return headerView
		default:
			return UIView()
		}
	}
	
	func modify(_ cell: UITableViewCell, for indexPath: IndexPath) -> UITableViewCell {
		guard let viewModel = viewModel else { return UITableViewCell() }
		
		switch (indexPath.section) {
		case 0:
			return "LabeledTableViewCell"
		case 1:
			return "DefaultCellTableViewCell"
		case 2:
			return "ProductActivityTableViewCell"
		default:
			return ""
		}
	}
	
	func firsSection(_ cell: UITableViewCell, for row: Int) -> UITableViewCell {
		guard let cell = cell as? LabeledTableViewCell else { return UITableViewCell() }
		if (row == 0) {
			cell.setupProductNameLabelWith(<#T##productName: String##String#>)
		}
	}
}
