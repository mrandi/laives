//
//  ViewController.swift
//  laives
//
//  Created by Michele Randi on 03/05/16.
//  Copyright © 2016 Michele Randi. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    @IBOutlet weak var tableView: NSTableView!
        
    @IBOutlet var textView: NSTextView!
    
    private let clipBoard: Clipboard = Clipboard()
    
    @IBAction func btnPaste(sender: AnyObject) { }
    
    
    override func viewWillAppear() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.setDelegate(self)
        tableView.setDataSource(self)
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
            
        }
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let clipBoardItem:String = clipBoard.getValues()[row]
        if let cell = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: nil) as? NSTableCellView{
            cell.textField?.stringValue = clipBoardItem
            return cell
        }
        return nil
        
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        let numberOfRows:Int = clipBoard.getValues().count
        return numberOfRows
    }
    
    
    func tableViewSelectionDidChange(notification: NSNotification) {
        let item:String = clipBoard.getValues()[tableView.selectedRow]
        textView.textStorage?.mutableString.setString(item)
    }
}


