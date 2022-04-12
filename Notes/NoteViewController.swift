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

    public var completionNote: ((String, String) -> Void)?

    public var noteTitle: String = ""
    public var note: String = ""
    public var image = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.becomeFirstResponder()
        titleLabel.text = noteTitle
        noteLabel.text = note
        imageV.image = image

//        imageV.image = UIImage(named: image)

        let saveButtonNote = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveNote))
        let editButton = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(didTapEditButton))

        navigationItem.rightBarButtonItems = [editButton, saveButtonNote]

    }

    @objc func didTapEditButton() {
        noteLabel.isEditable = true
    }

    @objc func didTapSaveNote() {
        if let noteText = noteLabel.text, !noteText.isEmpty, !titleLabel.text!.isEmpty {
            completionNote?(titleLabel.text!, noteText)
        }
    }
}

// Создать структуру - userDefaults; UUID format; доставать заметку через JSON
// Singleton pattern
// Как конвертить image в дату

// init current date and record
// change date type in ViewController


// Структура класса (логику класса и разделять ее на логические блоки - про Solid, про паттерн) -
// когда private когда public (переменные и функции) -
// как передавать данные между контроллерами (delegate, completion, в архитектурах паттернов - роутеры и прочее) -
// как правильно хранить данные -
// что такое структура, что такое класс - valueType, referenceType
// документацию прочесть (SwiftBook.ru)

