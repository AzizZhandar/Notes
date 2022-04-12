//
//  ViewController.swift
//  Notes
//
//  Created by Mukhamed-Aziz Zhandar on 04.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!

    var models: [(title: String, note: String, image: UIImage)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Notes"
    }

// MARK: - Creating new note function (Show EntryViewController)

    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "new") as? EntryViewController else {
            return
        }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note, image in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: noteTitle, note: note, image: image))
            self.label.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }


// MARK: - Show NoteViewController
// (need to add imageView)

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let model = models[indexPath.row]

        guard let vc = storyboard?.instantiateViewController(withIdentifier: "note") as? NoteViewController else {
            return
        }

//        let imageTransfer = EntryViewController()
//        imageTransfer.imageView

        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Note"
        vc.noteTitle = model.title
        vc.note = model.note
        vc.image = model.image
//        vc.image = String(imageTransfer.imageView)
        
        vc.completionNote = { noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.models[indexPath.row].title = noteTitle
            self.models[indexPath.row].note = note
            self.table.reloadData()
        }

        navigationController?.pushViewController(vc, animated: true)
    }

// MARK: - Deleting Rows in TableView

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}
