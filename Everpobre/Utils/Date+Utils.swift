//
//  Date+Utils.swift
//  Everpobre
//
//  Created by Charles Moncada on 09/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import Foundation

extension Date {
	func customStringLabel() -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		dateFormatter.timeStyle = .none
		dateFormatter.locale = Locale(identifier: "en_US")

		return "\(dateFormatter.string(from: self))"
	}
}
