//
//  Note.swift
//  Everpobre
//
//  Created by Charles Moncada on 08/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import Foundation

struct deprecated_Note {
	let title: String
	let text: String?
	let tags: [String]?
	let creationDate: Date
	let lastSeenDate: Date?

	static let dummyNotesModel: [deprecated_Note] = [
		deprecated_Note(title: "Primera nota", text: nil, tags: nil, creationDate: Date(), lastSeenDate: nil),
		deprecated_Note(title: "Segunda nota", text: "Test", tags: nil, creationDate: Date(), lastSeenDate: nil),
		deprecated_Note(title: "Tercera nota", text: "Texto de prueba", tags: nil, creationDate: Date(), lastSeenDate: nil),
		deprecated_Note(title: "Cuarta nota", text: "Algo de contenido", tags: nil, creationDate: Date(), lastSeenDate: nil),
		deprecated_Note(title: "Quinta nota", text: nil, tags: nil, creationDate: Date(), lastSeenDate: nil)
	]
}


