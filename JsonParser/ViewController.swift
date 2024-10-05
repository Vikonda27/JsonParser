//
//  ViewController.swift
//  JsonParser
//
//  Created by Alex Yehorov on 10/2/24.
//

import UIKit


struct Current: Codable {
    let condition: Condition
}
struct Condition: Codable {
    let text: String
    let icon: String
}
//add to json struct
struct WeatherData: Codable {
    let location: Location
    let current: Current
}
struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let localtime: String
}

let jsonLocation = """
{
 "name": "Brooklyn"
 "region": "New York"
 "country": "USA"
 "localtime": "12:00"
}
"""

let jsonString = """
{
  "name": "Jane Doe",
  "age": 25,
  "email": "janedoe@example.com",
}
"""

struct User: Codable {
    let name: String
    let age: Int
    let email: String
}

// How to parse JSON with optional fields in swift


class ViewController: UIViewController {
    
    func parseLocation() {
//fix 
        if let jsonData = jsonLocation.data(using: .utf8) {
            let decoder = JSONDecoder()
          
            do {
                let location = try decoder.decode(Location.self, from: jsonData)
                print("Name: \(location.name), Region: \(location.region), Country: \(location.country), Localtime: \(location.localtime) ")
            } catch {
                print("Error? could not be parsed")
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseLocation()
        
        // Do any additional setup after loading the view.
        
//        if let jsonData = jsonString.data(using: .utf8) {
//            
//            let decoder = JSONDecoder()
//            
//            do {
//                let user = try decoder.decode(User.self, from: jsonData)
//                print("Decoder")
//                print("Name: \(user.name), Age:\(user.age), Email:\(user.email)")
//            } catch {
//                print("Error? could not be parsed")
//            }
//        }
//        
//        
//        
//        let user = User(name: "Alex", age: 30, email: "alex.fox@gmail.com")
//        
//        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted
//        
//        do {
//            let jsonData = try encoder.encode(user)
//            if let jsonString = String(data: jsonData, encoding: .utf8) {
//                print("Encoder")
//                print(jsonString)
//            }
//        } catch {
//            print("encode failed")
//        }
    }
}

