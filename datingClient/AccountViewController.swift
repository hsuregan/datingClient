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
        //self.username.text = user.username;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}