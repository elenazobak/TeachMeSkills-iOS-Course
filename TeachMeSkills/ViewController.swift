//
//  ViewController.swift
//  TeachMeSkills
//
//  Created by Elena Zobak on 11/21/23.
//

import UIKit
import PhotosUI



    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    lazy var pHpicker: PHPickerViewController = {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.selectionLimit = 3
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        return picker
    }()
    
    lazy var picker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary
        } else if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            picker.sourceType = .savedPhotosAlbum
        } else if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            fatalError("Нет ни одного типа источника картинок")
        }
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        


        
    }
    
    @objc func getText(_ sender: UITextField) {
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
//        present(picker, animated: true)
        present(pHpicker, animated: true)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage
        imageView.image = image
//        PNG/.png, JPEG/.jpeg/.jpg
//        let imagePNG = image?.pngData()
//        let imageJPEG = image?.jpegData(compressionQuality: 1.0)
//        try! imagePNG?.write(to: <#T##URL#>)
        
        picker.dismiss(animated: true)
//       print(info)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    // MARK: - PHPickerViewControllerDelegate
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        print(results)
        let itemProviders = results.map{ $0.itemProvider }
        for item in itemProviders {
            item.loadObject(ofClass: UIImage.self) { image, error in
                let image = image as? UIImage
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
        picker.dismiss(animated: true)
        
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            5
        } else {
            10
        }
    }
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(component) - \(row)"
    }
    
}

