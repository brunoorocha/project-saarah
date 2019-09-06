//
//  PListManager.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 06/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

class PListManager {
	static func openFile(_ name: String) -> [Any]? {
		var format = PropertyListSerialization.PropertyListFormat.xml //format of the property list
		let plistPath: String? = Bundle.main.path(forResource: name, ofType: "plist")! //the path of the data
		let plistXML = FileManager.default.contents(atPath: plistPath!)! //the data in XML format
		do{ //convert the data to a dictionary and handle errors.
			let plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &format) as! [Any]
			
			return plistData
		}
		catch{ // error condition
			print("Error reading plist: \(error), format: \(format)")
			
			return nil
		}
	}
	
	static func load(_ form: String) -> [FormData] {
		var arrayFormData: [FormData] = []
		let plistData = openFile(form)
		
		if let cells = plistData as? [[String: Any]] {
			cells.forEach { (cell) in
				let formData = FormData(dictionary: cell)
				arrayFormData.append(formData)
			}
		}
		
		return arrayFormData
	}
}
