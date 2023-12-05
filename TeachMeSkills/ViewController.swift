//
//  ViewController.swift
//  11Lesson
//
//  Created by Artsiom Sazonau on 26.10.23.
//

import UIKit

protocol Costable {
    var cost: Int { get }
    
    func printCost()
}

extension Costable {
    func printCost() {
        print(cost)
    }
}

class Empty {}
class Position: Empty, Costable {
    
    var name: String
    var cost: Int
    
    init(name: String, cost: Int) {
        self.cost = cost
        self.name = name
    }
    
}


class Counter {
    var count = 0
    func dosmth() {
        count += 1
    }
}

class ViewController: UIViewController {
    
    let model = Counter()
    
    override func loadView() {
        super.loadView()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let object = Position(name: "Latte", cost: 10)
        
        func printed(object: Costable) {
            print(object.cost)
            object.printCost()
        }
        printed(object: object)
        
        let view = UIView(frame: CGRect.zero)
        let viewController = ViewController()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    deinit {
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
    
        model.dosmth()
//        if let nav = self.navigationController {
//            let emptyViewController = UIViewController()
//            nav.pushViewController(emptyViewController, animated: true)
//        } else {
//            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
//            let navigationController = UINavigationController(rootViewController: viewController)
//            present(navigationController, animated: true)
//
//        }
    }
    
}

