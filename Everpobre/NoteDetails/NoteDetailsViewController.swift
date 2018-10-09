//
//  NoteDetailsViewController.swift
//  Everpobre
//
//  Created by Charles Moncada on 08/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit

class NoteDetailsViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var tagsLabel: UILabel!
	@IBOutlet weak var creationDateLabel: UILabel!
	@IBOutlet weak var lastSeenDateLabel: UILabel!
	@IBOutlet weak var descriptionTextView: UITextView!

	let note: deprecated_Note

	init(note: deprecated_Note) {
		self.note = note
		super.init(nibName: "NoteDetailsViewController", bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		configure()
    }

	private func configure() {
		title = "Detalle"
		titleLabel.text = note.text
		tagsLabel.text = note.tags?.joined(separator: ",")
		creationDateLabel.text = "Creado: \(note.creationDate.customStringLabel())"
		lastSeenDateLabel.text = "Visto: \(note.lastSeenDate?.customStringLabel() ?? "ND")"
		descriptionTextView.text = note.text ?? "Ingrese texto..."
	}

}
