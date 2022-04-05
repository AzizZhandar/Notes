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

    public var completion: ((String, String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        let imageButton = UIBarButtonItem(title: "Image", style: .done, target: self, action: #selector(didImageTap))

        navigationItem.rightBarButtonItems = [saveButton, imageButton]
    }
    
    @objc func didTapSave() {
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
            completion?(text, noteField.text)
        }
            
    }
    
    @objc func didImageTap() {
        let vcImage = UIImagePickerController()
        vcImage.sourceType = .photoLibrary
        vcImage.delegate = self
        vcImage.allowsEditing = true
        present(vcImage, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
