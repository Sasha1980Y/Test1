//
//  ViewController.swift
//  Test1
//
//  Created by AlexanderYakovenko on 5/29/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

var usersClass = [User]()

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var enterYourLogin: UITextField!
    
    @IBOutlet weak var enterYourPassword: UITextField!
    
    @IBAction func signIn(_ sender: Any) {
        
        if (enterYourLogin.text == "" || enterYourPassword.text == "") {
            alertMessage(title: "Error", message: "Please fill all data", button: "OK")
            return
        }

        
        
        for i in 0..<usersClass.count {
            if (enterYourLogin.text == usersClass[i].login && enterYourPassword.text == usersClass[i].password ) {
                print("Ok")
                break
            } else {
                
                alertMessage(title: "Error", message: "Login or password is incorrect", button: "OK")
               print("Not Ok")
            }
        }
        
        print(usersClass)
        
    }

    @IBAction func signUp(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "LoginScreen2", bundle: nil)
        let nextViewController =   storyboard.instantiateViewController(withIdentifier: "LoginScreen2")
        present(nextViewController, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieve()
        
        // keyboards is open
        enterYourLogin.keyboardType = UIKeyboardType.asciiCapable
        enterYourLogin.becomeFirstResponder()
        
        // hidden navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // replace "Return" -> "Done"
        enterYourLogin.returnKeyType = UIReturnKeyType.done
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    
    // after Done  check second textField
    @IBAction func editingTextFieldEnd(_ sender: Any) {
        enterYourPassword.becomeFirstResponder()
        
    }
    
    
    // MARK: UserDefault
    /*
    func saveUserdefault() {
        
        let newUser = User(login: "sa", password: "555")
        usersClass.append(newUser)
        
        let defaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: usersClass)
        defaults.set(encodedData, forKey: "usersArray")
        defaults.synchronize()
        
        
    }
    */
    
    
    
    // MARK: UserDefault
    func retrieve () {
        
        
        let defaults = UserDefaults.standard
        let decoded = defaults.object(forKey: "usersArray") as! Data
        let decodedUserArray = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [User]
        usersClass = decodedUserArray
        
        
    }
    
    func alertMessage (title: String, message: String, button: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionAlertController = UIAlertAction(title: button, style: .default)
        alertController.addAction(actionAlertController)
        present(alertController, animated: true, completion: nil)
        
        
    }

}

