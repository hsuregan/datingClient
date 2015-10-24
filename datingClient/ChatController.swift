//
//  ChatController.swift
//  datingClient
//
//  Created by Regan Hsu on 10/23/15.
//  Copyright © 2015 Regan Hsu. All rights reserved.
//

import Foundation
import Socket_IO_Client_Swift


class ChatController: UIViewController {
    
    let socket = SocketIOClient(socketURL: "localhost:3000", options: [.Log(true), .ForcePolling(true)])
    var message = "reganhsu has something to say"

    @IBOutlet var chatThread: UIScrollView!
    //how do I populate the screen with this stuff in a view
    //custom view
    //how do i make the front show a bubble with this many msgs
    var unread_msgs = ["hello", "world", "what's", "up"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addHandlers()

        
        self.socket.on("connect") {data, ack in
            print("socket connected")
            
            // Sending messages
            self.socket.emit("add user", "reganhsuhsu")

        }
        
        self.socket.connect()
    }
    
    func loadViewFromNib() -> messageBox {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "messageBox", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! messageBox
        
        
        return view
    }
    
    func addHandlers() {
        self.socket.on("new message") {data, ack in
            print("NEW MESSAGE!!!!")
            if let d = data[0] as? NSDictionary {
                if let message = d.objectForKey("message") as? String{
                    if let username = d.objectForKey("username") as? String {
                        print("the message is " + message)
                        let messageBox = self.loadViewFromNib()
                        messageBox.message.text = username + ": " + message;
                        messageBox.center = CGPointMake(self.chatThread.frame.size.width/2, self.chatThread.frame.size.height/2)
                        self.chatThread.addSubview(messageBox);
                    }


                }
            }

            
            
        }
        
    }
    
    
    @IBAction func sendMessage(sender: AnyObject) {
        self.socket.emit("new message", message)
    }

    
}