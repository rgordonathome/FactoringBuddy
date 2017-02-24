//
//  AppDelegate.swift
//  Factoring Buddy
//
//  Created by Russell Gordon on 2/24/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    // MARK: Outlets
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var a: NSTextField!
    @IBOutlet weak var b: NSTextField!
    @IBOutlet weak var c: NSTextField!
    @IBOutlet weak var result: NSTextField!
    
    // MARK: AppDelegate
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    // MARK: Core logic

    @IBAction func factor(_ sender: Any) {
        
        print(a.intValue)
        print(b.intValue)
        print(c.intValue)
    }
    
    

}

