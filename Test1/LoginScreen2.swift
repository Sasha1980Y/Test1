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
    
    @IBOutlet weak var goIsActive: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldDetective()
       
        //createYourLogin.text = "sa"
        //enterCreateYourPassword.text = "555"
        
        
        /*
        if (createYourLogin.text == "" || enterCreateYourPassword.text == "" || repeatCreatePassword.text == "" || createYourLogin.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! ) {
            
            goIsActive.isEnabled = false
            
        }
        */
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        goIsActive.isEnabled = false
        goIsActive.backgroundColor = UIColor.gray
        
        // hidden navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // MARK: TITLE
        self.title = "Sign Up"
        
    }
    
    
    @IBAction func go2(_ sender: Any) {
        
        
        
        
        if enterCreateYourPassword.text != repeatCreatePassword.text {
            alertMessage(title: "Error", message: "Entered passwords are different", button: "Ok")
            return
        }
        
        for i in 0..<usersClass.count {
            if (createYourLogin.text == usersClass[i].login) {
                alertMessage(title: "Error", message: "User with entered login already exists", button: "Ok")
                return
            }
        }
        
        
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

    func alertMessage (title: String, message: String, button: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionAlertController = UIAlertAction(title: button, style: .default)
        alertController.addAction(actionAlertController)
        present(alertController, animated: true, completion: nil)
        
        
    }
    // MARK:  wait when field is not empty
    func textFieldDetective() {
        
        createYourLogin.addTarget(self, action: #selector(LoginScreen2.textFieldDidChange(textField:)) , for: UIControlEvents.editingChanged)
        
        enterCreateYourPassword.addTarget(self, action: #selector(textFieldDidChange(textField:)) , for: UIControlEvents.editingChanged)
        
        repeatCreatePassword.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        
        
    }
    // MARK: all field full
    func textFieldDidChange(textField: UITextField) {
        if (createYourLogin.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! || (enterCreateYourPassword.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! || (repeatCreatePassword.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! || createYourLogin.text == "" || enterCreateYourPassword.text == "" || repeatCreatePassword.text == "" {
            goIsActive.isEnabled = false
            goIsActive.backgroundColor = UIColor.gray
        
        } else {
            goIsActive.isEnabled = true
            goIsActive.backgroundColor = UIColor.black
        }
        /*
        if createYourLogin.text != "" &&
            enterCreateYourPassword.text != "" &&
            repeatCreatePassword.text != ""{
        
        
            goIsActive.isEnabled = true
        }*/
    }
    
 
}
