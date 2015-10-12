//
//  RegisterController.swift
//  datingClient
//
//  Created by Regan Hsu on 10/11/15.
//  Copyright © 2015 Regan Hsu. All rights reserved.
//

import Foundation

class RegisterController: UIViewController {
    @IBOutlet var Username: UITextField!
    @IBOutlet var password2: UITextField!
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func register() {
    
        let manager = AFHTTPRequestOperationManager()
        print("LOGIN func")
        
        var username = self.Username.text
            
        print(username)
        
        
        
        var params = [
            
            "username":"rerehsu6",
            "password":"password"
            
        ]
        
        print(params)
        
        manager.POST("http://localhost:3000/register",
            parameters: params,
            
            //what is needed for success to execute?
            success: { (AFHTTPRequestOperation, userObject) -> Void in
                
                
                print(userObject)
                print("successful registration!")
                
                
                
                
                
            }) { (AFHTTPRequestOperation, NSError) -> Void in
                print("fail")
                
                
        }
    }

}