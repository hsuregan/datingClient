//
//  startViewController.swift
//  datingClient
//
//  Created by Regan Hsu on 10/2/15.
//  Copyright (c) 2015 Regan Hsu. All rights reserved.
//

import Foundation
import UIKit

class startViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        


        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var token = defaults.objectForKey("token") //as? String
        //println("yay");
        print("startview controller start")
        print("token: ")
        print(token)
        
        
        ////LOGIN WITH TOKEN
        
        //token = "blah"
        
        if((token == nil)) {
            //go to the login screen
            print("token is nil")
            self.performSegueWithIdentifier("goToLogin", sender: self)
            
        } else {
            //go to the accountview
            //token = token as! String
            print("token is not nil: ")
            print(token)
            self.performSegueWithIdentifier("goToAccount", sender: self)
        }
        // call something to the server
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}