//
//  User.swift
//  Test1
//
//  Created by AlexanderYakovenko on 5/29/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    var login: String = "123"
    var password: String = "456"
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let login = aDecoder.decodeObject(forKey: "login") as! String
        let password = aDecoder.decodeObject(forKey: "password") as! String
        self.init(login: login , password: password)
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(login, forKey: "login")
        aCoder.encode(password, forKey: "password")
    }
}
