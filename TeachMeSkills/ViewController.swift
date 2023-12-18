//
//  ViewController.swift
//  TeachMeSkills
//
//  Created by Elena Zobak on 11/21/23.
//

import UIKit
import PhotosUI

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PHPickerViewControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    var text: String!

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
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            let controller = UIAlertController(title: "Ошибка", message: "", preferredStyle: .alert)
//            controller.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
////                self.text = textField.text
//                self.text = controller.textFields?.first?.text
//            }))
//            controller.addTextField { textField in
//                textField.placeholder = "Напишите свой отзыв!"
//                textField.addTarget(self, action: #selector(self.getText), for: .valueChanged)
//                textField.delegate = self
//            }
//            controller.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { _ in
//
//            }))
//            controller.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: { _ in
//
//            }))
//            self.present(controller, animated: true)
//        }
        
//        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: nil, queue: .main) { notification in
//            self.text = (notification.object as? UITextField)?.text
//        }
        
        // Do any additional setup after loading the view.
        
        
        
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


