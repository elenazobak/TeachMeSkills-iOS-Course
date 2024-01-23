//
//  ViewController.swift
//  TeachMeSkills
//
//  Created by Elena Zobak on 11/21/23.
//

import UIKit

struct ToDo: Codable {
    let id: Int
    let userId: Int
    let title: String
    let completed: Bool
    
    enum CodingKeys: CodingKey {
        case id
        case userId
        case title
        case completed
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.completed, forKey: .completed)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.userId = try container.decode(Int.self, forKey: .userId)
        self.title = try container.decode(String.self, forKey: .title)
        self.completed = try container.decode(Bool.self, forKey: .completed)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            let todo = try! JSONDecoder().decode(ToDo.self, from: data!)
            let data = try! JSONEncoder().encode(todo)
            
            
            let dict = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
//            let todo = ToDo(id: dict["id"] as! Int,
//                            title: dict["title"] as! String,
//                            completed: dict["completed"] as! Int)
//            let completed = dict["completed"] as! Int
//            let id = dict["id"] as! Int
//            let title = dict["title"] as! String
//            let userId = dict["userId"] as? Int ?? dict["user_id"] as? Int
            
            print(todo)
            print(dict)
//            print(data)
//            print(response)
//            print(error)
        }.resume()
        // Do any additional setup after loading the view.
    }


}
