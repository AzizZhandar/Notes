//
//  EntryViewController.swift
//  Notes
//
//  Created by Mukhamed-Aziz Zhandar on 04.04.2022.
//

import UIKit

class EntryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    @IBOutlet var imageView: UIImageView!

    private var image = UIImage()
    public var completion: ((String, String, UIImage) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        let imageButton = UIBarButtonItem(title: "Image", style: .done, target: self, action: #selector(didImageTap))
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))

        navigationItem.rightBarButtonItems = [imageButton, saveButton]
    }

    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
            completion?(text, noteField.text, image)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
            self.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }

    @objc func didImageTap() {
        let vcImage = UIImagePickerController()
        vcImage.sourceType = .photoLibrary
        vcImage.delegate = self
        vcImage.allowsEditing = true
        present(vcImage, animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
