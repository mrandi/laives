//
//  AppDelegate.swift
//  laives
//
//  Created by Michele Randi on 03/05/16.
//  Copyright © 2016 Michele Randi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)
    
    var pasteBoard = NSPasteboard.generalPasteboard()
    
    
    @IBOutlet weak var laivesCB: NSMenu!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        pasteBoard.clearContents()
        
        let icon = NSImage(named: "statusIcon")
        icon?.template = true
        statusItem.image = icon
        statusItem.toolTip = "Laives Clipboard Manager"
        
        pasteBoard.writeObjects(["wowow","test"])
        
        var i = 0
        while i <= pasteBoard.pasteboardItems!.count-1 {
            
            print(pasteBoard.pasteboardItems![i].stringForType("public.utf8-plain-text")!)
            
            let nsmi = NSMenuItem()
            nsmi.title = pasteBoard.pasteboardItems![i].stringForType("public.utf8-plain-text")!
            nsmi.action = #selector(AppDelegate.paste(_:))
            laivesCB.addItem(nsmi)
            
            i = i + 1
        }
        
        let q = NSMenuItem()
        q.title = "Quit"
        q.action = #selector(AppDelegate.quit(_:))
        laivesCB.addItem(q)
        
        statusItem.menu = laivesCB
        
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func paste(sender: NSMenuItem) {
        print("paste me")
    }
    
    @IBAction func quit(sender: AnyObject?) {
        NSApplication.sharedApplication().terminate(self)
    }

}

