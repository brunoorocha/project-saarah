//
//  FormTwoFieldsParallelTableViewCell.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 03/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class FormTwoFieldsParallelTableViewCell: UITableViewCell {
	var fieldNameLabel: UILabel!
	var inputDataTextField: UITextField!

	var formData: FormData?

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		selectionStyle = .none

		instantiateViews()
		buildViewsHierarchy()
		setupConstraints()
	}

	func setContent(_ data: FormData) {
		self.formData = data
		fieldNameLabel.text = data.fieldName
		inputDataTextField.placeholder = data.placeholder
		//need config the keyboard indicate by data
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func instantiateViews() {
		fieldNameLabel = UILabel(frame: .zero)
		fieldNameLabel.translatesAutoresizingMaskIntoConstraints = false
		inputDataTextField = UITextField(frame: .zero)
		inputDataTextField.translatesAutoresizingMaskIntoConstraints = false
		inputDataTextField.delegate = self
	}

	func buildViewsHierarchy() {
		contentView.addSubview(fieldNameLabel)
		contentView.addSubview(inputDataTextField)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			fieldNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			fieldNameLabel.centerYAnchor.constraint(equalTo: inputDataTextField.centerYAnchor),
			inputDataTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
			inputDataTextField.leadingAnchor.constraint(equalTo: fieldNameLabel.trailingAnchor),
			inputDataTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
			inputDataTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			inputDataTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}

extension FormTwoFieldsParallelTableViewCell: UITextFieldDelegate {
	func textFieldDidEndEditing(_ textField: UITextField) {
		let text = textField.text

		if let key = formData?.key {
			formData?.inputData[key] = text
		}
	}
}
