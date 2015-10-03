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
    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println(self.user.username)
        self.username.text = self.user.username //as? String;
      
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
        //defaults.getObject(for
        defaults.synchronize()
        
        
        manager.POST("http://localhost:3000/logout",
            parameters: params,
            
            //what is needed for success to execute?
            success: { (AFHTTPRequestOperation, AnyObject) -> Void in
                println("successful logout")
            }) { (AFHTTPRequestOperation, NSError) -> Void in
                println("fail")
        }
        
    }
    
}