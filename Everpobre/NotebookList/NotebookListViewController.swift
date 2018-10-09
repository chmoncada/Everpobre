//
//  NotebookListViewController.swift
//  Everpobre
//
//  Created by Charles Moncada on 08/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit
import CoreData

class NotebookListViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var managedContext: NSManagedObjectContext! // Beware to have a value before presenting the VC

//	var model: [deprecated_Notebook] = [] {
//		didSet {
//			tableView.reloadData()
//		}
//	}

	var dataSource: [NSManagedObject] {
		do {
			return try managedContext.fetch(Notebook.fetchRequest())
		} catch let error as NSError {
			print(error.localizedDescription)
			return []
		}
	}

	override func viewDidLoad() {
		//model = deprecated_Notebook.dummyNotebookModel
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationItem.largeTitleDisplayMode = .always
		
		super.viewDidLoad()
	}
	
	@IBAction func addNotebook(_ sender: UIBarButtonItem) {
		let alert = UIAlertController(title: "Nuevo Notebook", message: "Añade un nuevo Notebbok", preferredStyle: .alert)

		let saveAction = UIAlertAction(title: "Grabar", style: .default) { [unowned self] action in
			guard
				let textField = alert.textFields?.first,
				let nameToSave = textField.text
			else { return }

			let notebook = Notebook(context: self.managedContext)
			notebook.name = nameToSave
			notebook.creationDate = NSDate()

			do {
				try self.managedContext.save()
			} catch let error as NSError {
				print("TODO Error handling: \(error.debugDescription)")
			}

			self.tableView.reloadData()
		}

		let cancelAction = UIAlertAction(title: "Cancelar", style: .default)

		alert.addTextField()
		alert.addAction(saveAction)
		alert.addAction(cancelAction)

		present(alert, animated: true)
	}
}

// MARK:- UITableViewDataSource implementation

extension NotebookListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource.count//model.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "NotebookListCell", for: indexPath) as! NotebookListCell
		let notebook = dataSource[indexPath.row] as! Notebook
		//cell.configure(with: model[indexPath.row])
		cell.configure(with: notebook)

		return cell
	}

	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		guard
			let notebookToRemove = dataSource[indexPath.row] as? Notebook,
			editingStyle == .delete
		else { return }

		managedContext.delete(notebookToRemove)

		do {
			try managedContext.save()
			tableView.deleteRows(at: [indexPath], with: .automatic)
		} catch let error as NSError {
			print("error: \(error.localizedDescription)")
		}

		tableView.reloadData()

	}
}

// MARK:- UITableViewDelegate implementation

extension NotebookListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		let notebook = model[indexPath.row]
//		let notesListVC = NotesListViewController(notebook: notebook)
//		show(notesListVC, sender: nil)
	}
}
