//
//  FormTwoTextFieldsTableViewCell.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 12/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class FormTwoTextFieldsTableViewCell: UITableViewCell {
	var fieldOneTextField: UITextField!
	var fieldTwoTextField: UITextField!
	var quantityTypeLabel: UILabel!
	
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
	
	func instantiateViews() {
		fieldOneTextField = UITextField()
		fieldOneTextField.translatesAutoresizingMaskIntoConstraints = false
		fieldOneTextField.delegate = self
		fieldTwoTextField = UITextField()
		fieldTwoTextField.translatesAutoresizingMaskIntoConstraints = false
		fieldTwoTextField.delegate = self
		
	}
	
	func buildViewsHierarchy() {
		contentView.addSubview(fieldOneTextField)
		contentView.addSubview(fieldTwoTextField)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			fieldOneTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			fieldOneTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
			fieldOneTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			fieldTwoTextField.leadingAnchor.constraint(equalTo: fieldOneTextField.trailingAnchor),
			fieldTwoTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
			fieldTwoTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			fieldTwoTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}

extension FormTwoTextFieldsTableViewCell: UITextFieldDelegate {
	func textFieldDidEndEditing(_ textField: UITextField) {
		if textField == inputDataTextField {
			let text = textField.text
			
			if let key = formData?.key {
				formData?.fieldValue[key] = text
			}
		}
	}
}
