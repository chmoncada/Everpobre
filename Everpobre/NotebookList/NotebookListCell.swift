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

	func configure(with notebook: Notebook) {
		titleLabel.text = notebook.name
		creationDateLabel.text = creationString(from: notebook.creationDate)
	}

	private func creationString(from date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		dateFormatter.timeStyle = .none
		dateFormatter.locale = Locale(identifier: "en_US")

		return "Creado: \(dateFormatter.string(from: date))"
	}
}
