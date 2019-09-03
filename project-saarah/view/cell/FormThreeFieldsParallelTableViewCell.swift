//
//  FormThreeFieldsParallelTableViewCell.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 03/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol FormThreeFieldsParallelTableViewCellDelegate: class {
	func openPickerView()
}

class FormThreeFieldsParallelTableViewCell: UITableViewCell {
	var fieldNameLabel: UILabel!
	var getDataTextField: UITextField!
	var typeDataButton: UIButton!
	
	var delegate: FormThreeFieldsParallelTableViewCellDelegate?
	
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
	
	func setContent() {
		fieldNameLabel.text = "Outro campo"
		getDataTextField.placeholder = "Input do outro campo"
		typeDataButton.setTitle("??", for: .normal)
	}
	
	@objc func typeDataButtonAction() {
		delegate?.openPickerView()
	}
	
	func instantiateViews() {
		fieldNameLabel = UILabel(frame: .zero)
		fieldNameLabel.translatesAutoresizingMaskIntoConstraints = false
		getDataTextField = UITextField(frame: .zero)
		getDataTextField.translatesAutoresizingMaskIntoConstraints = false
		typeDataButton = UIButton(frame: .zero)
		typeDataButton.translatesAutoresizingMaskIntoConstraints = false
		typeDataButton.setTitle("?", for: .normal)
		typeDataButton.addTarget(self, action: #selector(typeDataButtonAction), for: .touchUpInside)
	}
	
	func buildViewsHierarchy() {
		contentView.addSubview(fieldNameLabel)
		contentView.addSubview(getDataTextField)
		contentView.addSubview(typeDataButton)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			fieldNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			fieldNameLabel.centerYAnchor.constraint(equalTo: getDataTextField.centerYAnchor),
			getDataTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			getDataTextField.leadingAnchor.constraint(equalTo: fieldNameLabel.trailingAnchor),
			getDataTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
			getDataTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			typeDataButton.leadingAnchor.constraint(equalTo: getDataTextField.trailingAnchor),
			typeDataButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			typeDataButton.centerYAnchor.constraint(equalTo: getDataTextField.centerYAnchor)
		])
	}
}
