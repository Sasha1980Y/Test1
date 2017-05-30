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
        
        
        
        for i in 0..<usersClass.count {
            if (enterYourLogin.text == usersClass[i].login) {
                print("Ok")
                break
            } else {
                print("Not Ok")
            }
            
        }
        
        print(usersClass)
        
        
        
    }

    @IBAction func signUp(_ sender: Any) {
        
        
        
        
        let storyboard = UIStoryboard(name: "LoginScreen2", bundle: nil)
        let nextViewController =   storyboard.instantiateViewController(withIdentifier: "LoginScreen2")
        
        
        
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
        
        saveUserdefault()
        // Dispose of any resources that can be recreated.
    }
    
    
    // after Done  check second textField
    @IBAction func editingTextFieldEnd(_ sender: Any) {
        enterYourPassword.becomeFirstResponder()
        
        
        
        
    }
    
    
    // MARK: UserDefault
    
    func saveUserdefault() {
        
        let newUser = User(login: "sa", password: "555")
        usersClass.append(newUser)
        
        let defaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: usersClass)
        defaults.set(encodedData, forKey: "usersArray")
        defaults.synchronize()
        
        
    }
    
    func retrieve () {
        
        if usersClass.count > 0 {
        let defaults = UserDefaults.standard
        let decoded = defaults.object(forKey: "usersArray") as! Data
        let decodedUserArray = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [User]
        usersClass = decodedUserArray
        
        }
    }
    
    
    
    


}

