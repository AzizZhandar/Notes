//
//  NoteViewController.swift
//  Notes
//
//  Created by Mukhamed-Aziz Zhandar on 04.04.2022.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    @IBOutlet var imageV: UIImageView!

    public var completion: ((String, String) -> Void)?
    public var noteTitle: String = ""
    public var note: String = ""
    public var image: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        noteLabel.text = note
        imageV.image = UIImage(named: image)

        let editButton = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(didTapEditButton))
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveNote))
        navigationItem.rightBarButtonItems = [editButton, saveButton]

    }
    
    @objc func didTapEditButton() {
        noteLabel.isEditable = true
    }

    @objc func didTapSaveNote() {
        if let textNote = titleLabel.text, !textNote.isEmpty, !noteLabel.text.isEmpty {
            completion?(textNote, noteLabel.text)
        }
    }
    
}
