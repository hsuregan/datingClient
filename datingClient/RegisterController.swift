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
            
            "username":"rerehsu14",
            "password":"password",
           //for some reason got to store this
            "active": "",
            "token": ""
            
        ]
        
        print(params)
        
        manager.POST("http://localhost:3000/register",
            parameters: params,
            
            //what is needed for success to execute?
            success: { (AFHTTPRequestOperation, userObject) -> Void in
                
                
                print(userObject)
                print("successful registration!")
              
                
                manager.POST("http://localhost:3000/login1",
                    parameters: params,
                    
                    //what is needed for success to execute?
                    success: { (AFHTTPRequestOperation, userObject) -> Void in
                        print(userObject)
                        if let results = userObject as? NSDictionary {
                            if let token = results["token"] as? String {
                                if let user_details = results["user"] as? NSDictionary {
                                    if let username = user_details["username"] as? String {
                                        
                                        let user_to_store = User(username: username, token: token)
                                        
                                        print("token: " + user_to_store.token)
                                        print("username: " + user_to_store.username)
                                        
                                        
                                        let defaults = NSUserDefaults.standardUserDefaults()
                                        
                                        defaults.setObject(NSKeyedArchiver.archivedDataWithRootObject(user_to_store), forKey: "user")
                                        
                                        defaults.setObject(token, forKey: "token")
                                        defaults.synchronize()
                                        
                                        print(defaults.valueForKey("token") as! String)
                                        print("SUCCESSFULLY STORED USER INFO")
                                        
                                        self.performSegueWithIdentifier("openProfilefromRegister", sender: self)
                                    }
                                }
                            }
                        }
                    }) { (AFHTTPRequestOperation, NSError) -> Void in
                        print("fail")
                        
                        
                }
                
                
                
                
                
                
                
                
                
                
                
                
            }) { (AFHTTPRequestOperation, NSError) -> Void in
                print("fail")
                
                
        }
    }

}