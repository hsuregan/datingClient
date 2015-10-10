//
//  User.swift
//  datingClient
//
//  Created by Regan Hsu on 10/2/15.
//  Copyright (c) 2015 Regan Hsu. All rights reserved.
//

import Foundation


class User  : NSObject, NSCoding {
    
    //http://stackoverflow.com/questions/26469457/saving-custom-swift-class-with-nscoding-to-userdefaults
    
    var username:String!
    var token:String!

    
    init(username:String, token: String) {
        self.username = username
        self.token = token
    }
    
    
    override init() {}
    
    required init(coder aDecoder: NSCoder) {
        if let username = aDecoder.decodeObjectForKey("username") as? String {
            self.username = username
        }
        
        if let token = aDecoder.decodeObjectForKey("token") as? String {
            self.token = token
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let username = self.username {
            aCoder.encodeObject(username, forKey: "username")
            print("username encodeWith")
        }
        if let token = self.token {
            aCoder.encodeObject(token, forKey: "token")
            print("token encodeWith")

        }
    }

    //if token is expired, logout
    //if token is not expired, stay logged in
    //everytime viewDidLoad check
    
    //people you match with
    //var matches = [String:User]()
}