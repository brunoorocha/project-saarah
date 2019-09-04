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
	var getDataTextField: UITextField!

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		selectionStyle = .none

		instantiateViews()
		buildViewsHierarchy()
		setupConstraints()
	}

	func setContent() {
		fieldNameLabel.text = "Campo do form"
		getDataTextField.placeholder = "recebe campo do form"
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func instantiateViews() {
		fieldNameLabel = UILabel(frame: .zero)
		fieldNameLabel.translatesAutoresizingMaskIntoConstraints = false
		getDataTextField = UITextField(frame: .zero)
		getDataTextField.translatesAutoresizingMaskIntoConstraints = false
	}

	func buildViewsHierarchy() {
		contentView.addSubview(fieldNameLabel)
		contentView.addSubview(getDataTextField)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			fieldNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			fieldNameLabel.centerYAnchor.constraint(equalTo: getDataTextField.centerYAnchor),
			getDataTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
			getDataTextField.leadingAnchor.constraint(equalTo: fieldNameLabel.trailingAnchor),
			getDataTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
			getDataTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			getDataTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
		])
	}
}
