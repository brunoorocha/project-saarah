//
//  FormThreeFieldsParallelTableViewCell.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 03/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class FormThreeFieldsParallelTableViewCell: UITableViewCell {
	var fieldNameLabel: UILabel!
	var inputDataTextField: UITextField!
	var typeDataTextField: UITextField!
	let typeDataPickerView = UIPickerView()
	
	var formData: FormData?

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

	func setContent(_ data: FormData) {
		self.formData = data
		fieldNameLabel.text = data.fieldName
		inputDataTextField.placeholder = data.placeholder
		//need config the keyboard indicate by data
		
		//set the input for pickerview in the dictionary
		let keyType = "\(data.key)Type"
		let pickerViewRow = typeDataPickerView.selectedRow(inComponent: 0)
		let valueType = QuantityType.allCases[pickerViewRow].rawValue
		formData?.inputData[keyType] = valueType
	}

	@objc func dismissTypeDataPickerView() {
		contentView.endEditing(true)
	}

	func instantiateViews() {
		fieldNameLabel = UILabel(frame: .zero)
		fieldNameLabel.translatesAutoresizingMaskIntoConstraints = false
		inputDataTextField = UITextField(frame: .zero)
		inputDataTextField.translatesAutoresizingMaskIntoConstraints = false
		inputDataTextField.delegate = self
		typeDataTextField = UITextField(frame: .zero)
		typeDataTextField.translatesAutoresizingMaskIntoConstraints = false
		typeDataTextField.textAlignment = .center
		typeDataTextField.delegate = self
		typeDataTextField.inputView = typeDataPickerView
		typeDataTextField.text = QuantityType.allCases[0].rawValue
		typeDataPickerView.delegate = self

		let toolBar = UIToolbar()
		toolBar.barStyle = UIBarStyle.default
		toolBar.isTranslucent = true
		toolBar.sizeToFit()
		let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissTypeDataPickerView))
		let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		toolBar.setItems([ spaceButton, doneButton], animated: false)
		toolBar.isUserInteractionEnabled = true
		typeDataTextField.inputAccessoryView = toolBar
	}

	func buildViewsHierarchy() {
		contentView.addSubview(fieldNameLabel)
		contentView.addSubview(inputDataTextField)
		contentView.addSubview(typeDataTextField)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			fieldNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			fieldNameLabel.centerYAnchor.constraint(equalTo: inputDataTextField.centerYAnchor),
			inputDataTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
			inputDataTextField.leadingAnchor.constraint(equalTo: fieldNameLabel.trailingAnchor),
			inputDataTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
			inputDataTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			typeDataTextField.leadingAnchor.constraint(equalTo: inputDataTextField.trailingAnchor),
			typeDataTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			typeDataTextField.centerYAnchor.constraint(equalTo: inputDataTextField.centerYAnchor)
		])
	}
}

extension FormThreeFieldsParallelTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return QuantityType.allCases.count
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return QuantityType.allCases[row].rawValue
	}

	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		let text = QuantityType.allCases[row].rawValue
		
		typeDataTextField.text = text
		
		if let key = formData?.key {
			let keyForPicker = "\(key)Type"
			formData?.inputData[keyForPicker] = text
		}
	}
}

extension FormThreeFieldsParallelTableViewCell: UITextFieldDelegate {
	func textFieldDidBeginEditing(_ textField: UITextField) {
		if (textField == typeDataTextField) {
			let item = textField.inputAssistantItem
			item.leadingBarButtonGroups = []
			item.trailingBarButtonGroups = []
		}
	}

	func textFieldDidEndEditing(_ textField: UITextField) {
		let text = textField.text
		
		if let key = formData?.key {
			formData?.inputData[key] = text
		}
	}
}
