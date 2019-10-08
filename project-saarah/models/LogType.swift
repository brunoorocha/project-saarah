//
//  LogType.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

enum LogType: String {
	case input = "in"
	case output = "out"

	var image: UIImage {
		switch (self) {
		case .input:
			if let image = UIImage(named: "activity-arrow-up") {
				return image
			}
		case .output:
			//TODO: - insert the arrow-down in assets and place the name here
			if let image = UIImage(named: self.rawValue) {
				return image
			}
		}

		return UIImage()
	}
}
