//
//  LoginScreen.swift
//  Test1
//
//  Created by AlexanderYakovenko on 5/29/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {
    
    @IBOutlet weak var createYourLogin: UITextField!
    
    @IBOutlet weak var enterCreateYourPassword: UITextField!
    
    @IBOutlet weak var repeatPassword: UITextField!
    
    
    
    @IBAction func go(_ sender: Any) {
        
        if createYourLogin.text != nil && enterCreateYourPassword.text != nil {
            let login = createYourLogin.text
            let pass = enterCreateYourPassword.text
            
            users.append(username: login!, password: pass!)
        }
        
        
        
        print(users)
        
        //let defaults = UserDefaults.standard
        
        
        
        
        //saveUserdefault()
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
        goButton.isEnabled = false
        goButton.backgroundColor = UIColor.gray
        */
 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    

}
