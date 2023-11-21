//
//  ViewController.swift
//  TeachMeSkills
//
//  Created by Elena Zobak on 11/21/23.
//

import UIKit

class DownloadImageOperation: Operation {
    
    var image: UIImage?
    
    override func main() {
        let url = URL(string: "https://svs.gsfc.nasa.gov/vis/a030000/a030800/a030877/frames/5760x3240_16x9_01p/BlackMarble_2016_928m_india_labeled.png")!
        let data = try! Data(contentsOf: url)
        let image = UIImage(data: data)
        self.image = image
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    let queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gcdQueue = DispatchQueue.global(qos: .default)
        queue.underlyingQueue = gcdQueue
        
        let firstOperation = BlockOperation {
            print("FirstOperation")
        }
        firstOperation.addExecutionBlock {
            print("FirstOperation 2")
        }
        firstOperation.addExecutionBlock {
            print("FirstOperation 3")
        }
        
        queue.addOperation(firstOperation)
        
        
        let imageDownloadOperation = DownloadImageOperation()
        imageDownloadOperation.completionBlock = {
            OperationQueue.main.addOperation {
                self.imageView.image = imageDownloadOperation.image
                print("DownloadImageOperation completed")

            }
//            DispatchQueue.main.async {
//                self.imageView.image = imageDownloadOperation.image
//                print("DownloadImageOperation completed")
//            }
        }
        queue.addOperation(imageDownloadOperation)
        
    }
    
}

