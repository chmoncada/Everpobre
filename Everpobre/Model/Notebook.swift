//
//  Notebook.swift
//  Everpobre
//
//  Created by Charles Moncada on 08/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import Foundation

struct Notebook {
	let name: String
	let creationDate: Date
	let notes: [Note]

	static let dummyNotebookModel: [Notebook] = [
		Notebook(name: "Prueba 1", creationDate: Date(), notes: []),
		Notebook(name: "Prueba 2", creationDate: Date().calculateDate(fromDaysBefore: 5), notes: []),
		Notebook(name: "Prueba 3", creationDate: Date().calculateDate(fromDaysBefore: 7), notes: []),
		Notebook(name: "Prueba 4", creationDate: Date().calculateDate(fromDaysBefore: 7), notes: []),
		Notebook(name: "Prueba 5", creationDate: Date().calculateDate(fromDaysBefore: 7), notes: []),
		Notebook(name: "Prueba 6", creationDate: Date().calculateDate(fromDaysBefore: 8), notes: []),
		Notebook(name: "Prueba 7", creationDate: Date().calculateDate(fromDaysBefore: 9), notes: []),
		Notebook(name: "Prueba 8", creationDate: Date().calculateDate(fromDaysBefore: 10), notes: [])
	]
}

extension Date {
	func calculateDate(fromDaysBefore days: Int) -> Date {
		return Calendar.current.date(byAdding: .day, value: -days, to: self) ?? Date()
	}
}


