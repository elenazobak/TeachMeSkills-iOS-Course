//
//  ViewController.swift
//  TeachMeSkills
//
//  Created by Elena Zobak on 11/21/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let semaphore = DispatchSemaphore(value: 3) // Allowing up to 3 tasks at a time
        let group = DispatchGroup()

        for i in 1...10 {
            DispatchQueue.global().async {
                semaphore.wait() // Wait for the semaphore (traffic light)
                
                group.enter()
                // Perform a task (car passing)
                print("Task \(i) started")
                Thread.sleep(forTimeInterval: 2)
                print("Task \(i) finished")
                group.leave()
                
                semaphore.signal() // Release the semaphore (traffic light)
            }
        }

        group.notify(queue: .main) {
            print("All tasks completed!")
        }
    }


    
}

