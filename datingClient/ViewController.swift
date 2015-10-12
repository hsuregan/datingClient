//
//  ViewController.swift
//  datingClient
//
//  Created by Regan Hsu on 9/27/15.
//  Copyright (c) 2015 Regan Hsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginUsername: UITextField!
    @IBOutlet var loginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login() {
        //println(loginUsername.text)
        let manager = AFHTTPRequestOperationManager()
        print("LOGIN func")
        var params = [
            
            "username":"hsuregan5",
            "password":"ugh"
            
        ]
//        params = [
//            "username": loginUsername.text as? String,
//            "password": loginPassword.text as? String
//        ]
//        
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

                                self.performSegueWithIdentifier("openProfile", sender: self)
                            }
                        }
                    }
                }
            }) { (AFHTTPRequestOperation, NSError) -> Void in
                print("fail")
            

        }

        
    }
    
//    @IBAction func register() {
//        let manager = AFHTTPRequestOperationManager()
//        print("LOGIN func")
//        var params = [
//            
//            "username":"\()",
//            "password":"ugh"
//            
//        ]
//    }

    
    
    //if login fails how do I redirect back?
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "openProfile") {
            
            //store the user into the iphone

            
            //self.user = User(username: "hsuregan5")
            //let newViewController = segue.destinationViewController as! AccountViewController

            
            //print(self.user.username)
            //newViewController.user = self.user
            
        }
    }
    


}

