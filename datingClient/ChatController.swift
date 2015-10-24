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
    let message = "reganhsu has something to say"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.socket.on("connect") {data, ack in
            print("socket connected")
            
            // Sending messages
            self.socket.emit("add user", "reganhsuhsu")
            

        }
        
        self.socket.connect()

        
    }
    
    @IBAction func sendMessage(sender: AnyObject) {
        self.socket.emit("new message", message)
    }

    
}