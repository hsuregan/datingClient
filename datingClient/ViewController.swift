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
                println(userObject)
                if let results = userObject as? NSDictionary {
                    if let user_details = results["user"] as? NSDictionary {
                        if let username = user_details["username"] as? String {
                            self.user = User(username: username, token: "helloworld")
                            let defaults = NSUserDefaults.standardUserDefaults()
                            defaults.setObject(self.user.token, forKey: "token")
                            //defaults.getObject(for
                            defaults.synchronize()
                            self.performSegueWithIdentifier("openProfile", sender: self)

                        }
                        
                    }
                }
            }) { (AFHTTPRequestOperation, NSError) -> Void in
                println("fail")
                
                

        }

        
    }
    

    
    //if login fails how do I redirect back?
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "openProfile") {
            
            //self.user = User(username: "hsuregan5")
            let newViewController = segue.destinationViewController as! AccountViewController
            
            println("YAY::")
            println(self.user.username)
            newViewController.user = self.user
            
        }
    }
    


}

