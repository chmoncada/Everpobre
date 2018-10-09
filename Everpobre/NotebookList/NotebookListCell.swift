//
//  NotebookListCell.swift
//  Everpobre
//
//  Created by Charles Moncada on 08/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit

class NotebookListCell: UITableViewCell {

	@IBOutlet private weak var titleLabel: UILabel!
	@IBOutlet private weak var creationDateLabel: UILabel!

	override func prepareForReuse() {
		titleLabel.text = nil
		creationDateLabel.text = nil
		super.prepareForReuse()
	}

	func configure(with notebook: deprecated_Notebook) {
		titleLabel.text = notebook.name
		creationDateLabel.text = "Creado: \(notebook.creationDate.customStringLabel())"
	}
}
