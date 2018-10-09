//
//  NotesListViewController.swift
//  Everpobre
//
//  Created by Charles Moncada on 08/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit

class NotesListViewController: UIViewController {

	lazy var tableView: UITableView = {
		let tableView = UITableView(frame: .zero, style: .plain)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		return tableView
	}()

	let notebook: Notebook//deprecated_Notebook

//	var notes: [deprecated_Note] = [] {
//		didSet {
//			tableView.reloadData()
//		}
//	}

	var notes: [Note] {
		guard let notes = notebook.notes?.array else { return [] }

		return notes as! [Note]
	}

	init(notebook: Notebook) {
		self.notebook = notebook
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		//self.navigationController?.navigationBar.isTranslucent = false
		title = "Notas"

		let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add
			, target: self, action: #selector(addNote))
		navigationItem.rightBarButtonItem = addButtonItem

		setupTableView()
	}

	@objc private func addNote() {
		let newNoteVC = NoteDetailsViewController(kind: .new)
		let navVC = UINavigationController(rootViewController: newNoteVC)
		present(navVC, animated: true, completion: nil)
	}

	private func setupTableView() {
		tableView.dataSource = self
		tableView.delegate = self

		view.addSubview(tableView)

		tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

	}
}

extension NotesListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return notes.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
		cell.textLabel?.text = notes[indexPath.row].title

		return cell
	}
}

extension NotesListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//let detailVC = NoteDetailsViewController(note: notes[indexPath.row])
		let detailVC = NoteDetailsViewController(kind: .existing(notes[indexPath.row]))
		show(detailVC, sender: nil)
	}
}
