//
//  ViewController.swift
//  Test1
//
//  Created by AlexanderYakovenko on 5/29/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var enterYourLogin: UITextField!
    
    @IBOutlet weak var enterYourPassword: UITextField!
    
    @IBAction func signIn(_ sender: Any) {
    }

    @IBAction func signUp(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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


}

