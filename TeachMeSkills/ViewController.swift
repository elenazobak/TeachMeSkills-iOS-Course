//
//  ViewController.swift
//  9Lesson
//
//  Created by Artsiom Sazonau on 19.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    var firstproperty: Int = 0
    let secondProperty: Int = 1234
    static let name = "ViewController"
    
    lazy var color: UIColor = {
        if label.text == "ok" {
            return .red
        } else {
            return .blue
        }
    }()
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTaaped(_ sender: UIButton) {
        label.textColor = .black
    }
    
}

