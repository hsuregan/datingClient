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
    var user:User! //login
    
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
        
        var params = [
            
            "username":"hsuregan5",
            "password":"ugh"
            
        ]
        
        manager.POST("http://localhost:3000/login1",
            parameters: params,
            
            //what is needed for success to execute?
            success: { (AFHTTPRequestOperation, userObject) -> Void in
                //println(userObject)
                if let results = userObject as? NSDictionary {
                    if let user_details = results["user"] as? NSDictionary {
                        if let username = user_details["username"] as? String {
                            self.user = User(username: username)
                        }
                    }
                }
                //println("successful login")
            }) { (AFHTTPRequestOperation, NSError) -> Void in
                println("fail")
        }

        
        
    }
    

    
    @IBAction func logout() {
        //println(loginUsername.text)
        let manager = AFHTTPRequestOperationManager()
        
        var params = [
            
            "username":"hsuregan5",
            "password":"ugh"
            
        ]
        
        manager.POST("http://localhost:3000/logout",
            parameters: params,
            
            //what is needed for success to execute?
            success: { (AFHTTPRequestOperation, AnyObject) -> Void in
                println("successful login")
            }) { (AFHTTPRequestOperation, NSError) -> Void in
                println("fail")
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "openProfile") {
            let newViewController = segue.destinationViewController as! AccountViewController
            //wait for thread in login() to finish

            //println(self.user.username)
            //newViewController.user = self.user
            
        }
    }
    


}

