//
//  AccountViewController.swift
//  datingClient
//
//  Created by Regan Hsu on 10/2/15.
//  Copyright (c) 2015 Regan Hsu. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet var username: UILabel!
    @IBOutlet var Token: UILabel!

    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        print("ACCOUNT VIEW LOADED, USER: ")
        
        if let data = defaults.objectForKey("user") as? NSData {

            let unarc = NSKeyedUnarchiver(forReadingWithData: data)

            self.Token.text = defaults.valueForKey("token") as! String

            if let user = unarc.decodeObjectForKey("root") as? User {
                self.user = user;
                self.username.text = user.username
            }
        
        }

        
        //print(user.username)
        //SAVE USER INTO CORE DATA
        //self.user = defaults.valueForKey("user") as! User
        //self.username.text = self.user["username"]
        
        
        // Do any additional setup after loading the view, typically from a nib.
        //println(self.user.username)
        //self.username.text = self.user.username //as? String;
        //let defaults = NSUserDefaults.standardUserDefaults()
        //self.Token.text = defaults.dataForKey("token") as! String
//        self.Token.text = defaults.get
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout() {
        //println(loginUsername.text)
        let manager = AFHTTPRequestOperationManager()
        
        var params = [
            
            "username":"hsuregan5",
            "password":"ugh"
            
        ]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(nil, forKey: "token")
        defaults.setObject(nil, forKey: "user")

        //defaults.getObject(for
        defaults.synchronize()
        
        
        manager.POST("http://localhost:3000/logout",
            parameters: params,
            
            //what is needed for success to execute?
            success: { (AFHTTPRequestOperation, AnyObject) -> Void in
                print("successful logout")
            }) { (AFHTTPRequestOperation, NSError) -> Void in
                print("fail")
        }
        
    }
    
}