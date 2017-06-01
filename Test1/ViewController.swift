//
//  ViewController.swift
//  Test1
//
//  Created by AlexanderYakovenko on 5/29/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//
/*
protocol ViewControllerDelegate {
    <#requirements#>
}
*/

import UIKit

var usersClass = [User]()

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var enterYourLogin: UITextField!
    
    @IBOutlet weak var enterYourPassword: UITextField!
    
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    
    
    @IBAction func signIn(_ sender: Any) {
        
        if (enterYourLogin.text == "" || enterYourPassword.text == "") {
            alertMessage(title: "Error", message: "Please fill all data", button: "OK")
            return
        }

        
        
        for i in 0..<usersClass.count {
            if (enterYourLogin.text == usersClass[i].login && enterYourPassword.text == usersClass[i].password ) {
                print("Ok")
                return
            } else {
                print("Not ok")
            }
        }
        
        print(usersClass)
        alertMessage(title: "Error", message: "Login or password is incorrect", button: "OK")
        
    }

    @IBAction func signUp(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "LoginScreen2", bundle: nil)
        let nextViewController =   storyboard.instantiateViewController(withIdentifier: "LoginScreen2")
        navigationController?.pushViewController(nextViewController, animated: true)
        
        // present(nextViewController, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "usersArray") != nil {
        retrieve()
        }
        // keyboards is open
        enterYourLogin.keyboardType = UIKeyboardType.asciiCapable
        enterYourLogin.becomeFirstResponder()
        
        
        
        // replace "Return" -> "Done"
        enterYourLogin.returnKeyType = UIReturnKeyType.next
        
    }
    // MARK: hidden Navigation Bar
    override func viewDidAppear(_ animated: Bool) {
        // hidden navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // after Done  check second textField
    @IBAction func editingTextFieldEnd(_ sender: Any) {
        enterYourPassword.becomeFirstResponder()
        
    }
    @IBAction func editingEndEnterYourPasswordTextField(_ sender: Any) {
        signUpButtonOutlet.becomeFirstResponder()
        signIn(enterYourPassword)
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
    
    enum errorUserDefault: Error {
        case userDefaultIsNil
    }
    
    
    
    
    func retrieve ()   {
        
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

