//
//  FormButtonTableViewCell.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 10/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol FormButtonTableViewCellDelegate: class {
	func addNewCell()
}

class FormButtonTableViewCell: UITableViewCell {
	var addButton: UIButton!
	
	var delegate: FormButtonTableViewCellDelegate?
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		selectionStyle = .none
		
		instantiateViews()
		buildViewsHierarchy()
		setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func addButtonAction() {
		delegate?.addNewCell()
	}
	
	func setContent(_ data: FormData) {
		addButton.setTitle(data.fieldName, for: .normal)
	}
	
	func instantiateViews() {
		addButton = UIButton()
		addButton.translatesAutoresizingMaskIntoConstraints = false
		addButton.setTitleColor(UIColor.blue, for: .normal)
		addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
	}
	
	func buildViewsHierarchy() {
		addSubview(addButton)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			addButton.topAnchor.constraint(equalTo: contentView.topAnchor),
			addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}
