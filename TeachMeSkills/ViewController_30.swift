//
//  ViewController_30.swift
//  TeachMeSkills
//
//  Created by Elena Zobak on 2/2/24.
//

import UIKit
//import CoreData
////import Realm
//import SQLite3
////import Keychain

struct Person: Codable {
    let id: Int
    let name: String
    let age: Double
    let hasBankAccount: Bool
}

enum Keys {
    static let id = "id"
    static let name = "name"
    static let age = "age"
    static let hasBankAccount = "hasBankAccount"
    static let dict = "dict"
    static let person = "person"
}

extension UserDefaults {
    func removeObjects(forKeys keys: [String]) {
        keys.forEach(removeObject(forKey:))
    }
    
    func setObjects(_ objects:[Any], andKeys keys: [String]) {
        for i in 0..<objects.count {
            set(objects[i], forKey: keys[i])
        }
    }
    
    func setObjects(_ objects: [(Any, String)]) {
        objects.forEach {
            set($0.0, forKey: $0.1)
        }
    }
}

class ViewController: UIViewController {
    
    let person = Person(id: 1024,
                        name: "Ivan",
                        age: 19.7,
                        hasBankAccount: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let userDefaults = UserDefaults.standard
        // 1
//        userDefaults.setObjects([person.id,
//                                 person.name,
//                                 person.age,
//                                 person.hasBankAccount],
//                                andKeys: [Keys.id,
//                                          Keys.name,
//                                          Keys.age,
//                                          Keys.hasBankAccount])
//
//        let id = userDefaults.integer(forKey: Keys.id)
//        let name = userDefaults.string(forKey: Keys.name) ?? ""
//        let age = userDefaults.double(forKey: Keys.age)
//        let hasBankAccount = userDefaults.bool(forKey: Keys.hasBankAccount)
//
//        let person2 = Person(id: id,
//                             name: name,
//                             age: age,
//                             hasBankAccount: hasBankAccount)
//
//        userDefaults.removeObjects(forKeys: [Keys.id, Keys.name, Keys.age, Keys.hasBankAccount])
//
//        userDefaults.set(["isDictionary": true], forKey: Keys.dict)
        // 2
//        let encoder = JSONEncoder()
//        let decoder = JSONDecoder()
//        let data = try! encoder.encode(person)
//        userDefaults.set(data, forKey: Keys.person)
//        print(UserDefaults.standard.dictionaryRepresentation())
//        if let data = userDefaults.data(forKey: Keys.person) {
//            let person3 = try! decoder.decode(Person.self, from: data)
//            print(person3)
//        } else {
//            fatalError()
//        }
//        userDefaults.synchronize()
        
        let cachesUrl = FileManager.default.cachesDirectory
        let tmpDirectoryUrl = FileManager.default.temporaryDirectory
        let personsUrl = cachesUrl.appending(path: "persons")
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let data = try! encoder.encode(person)
//        let isDirectory: UnsafeMutablePointer<ObjCBool> = .init(bitPattern: 1)!
//        if !FileManager.default.fileExists(atPath: personsUrl.absoluteString, isDirectory: isDirectory) {
//            try! FileManager.default.createDirectory(at: personsUrl, withIntermediateDirectories: false)
//        }
//        FileManager.default.createFile(atPath: personsUrl.absoluteString,
//                                       contents: data)
        // Creating File First.person
        let fileUrl = personsUrl.appending(path: "First").appendingPathExtension("person")
        let lastPath = fileUrl.lastPathComponent
        let destinationUrl = cachesUrl.appending(path: lastPath)
//        try! data.write(to: fileUrl)
//        try! FileManager.default.moveItem(at: fileUrl, to: destinationUrl)
//        try! FileManager.default.copyItem(at: fileUrl, to: destinationUrl)
//        try! FileManager.default.removeItem(at: fileUrl)
        print(personsUrl)
        
        
        
        
        
        
        
//        FileManager
    }


}
 
extension FileManager {
    
    var cachesDirectory: URL {
        urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
    
}
