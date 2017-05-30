//
//  LoginScreen2.swift
//  Test1
//
//  Created by AlexanderYakovenko on 5/29/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class LoginScreen2: UIViewController {
    
    
    @IBOutlet weak var createYourLogin: UITextField!
    
    @IBOutlet weak var enterCreateYourPassword: UITextField!
    
    @IBOutlet weak var repeatCreatePassword: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createYourLogin.text = "sa"
        enterCreateYourPassword.text = "555"
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func go2(_ sender: Any) {
        
        if createYourLogin.text != nil && enterCreateYourPassword.text != nil {
            let login = createYourLogin.text
            let pass = enterCreateYourPassword.text
            let newUser = User(login: login!, password: pass!)
            usersClass.append(newUser)
            
           
        }
        
        print(usersClass)
        saveUserdefault()   
        
    }
    
    
    
    // MARK: UserDefault
    
    func saveUserdefault() {
        
                
        let defaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: usersClass)
        defaults.set(encodedData, forKey: "usersArray")
        defaults.synchronize()
        
        
    }

     
     /*
     goButton.isEnabled = false
     goButton.backgroundColor = UIColor.gray
     */

 
}
