//
//  Clipboard.swift
//  laives
//
//  Created by Gregor Kneitschel on 03/05/16.
//  Copyright © 2016 Michele Randi. All rights reserved.
//

import Foundation
import Cocoa

class Clipboard  {
    private let pasteBoard = NSPasteboard.generalPasteboard();
    
    func getValues() -> [String] {
        var strArr: Array<String> = []
                for element in pasteBoard.pasteboardItems! {
                    if let str = element.stringForType("public.utf8-plain-text") {
                        strArr.append(str)
                    }
                }
        return ["Yo", "Mama"];//strArr;
        
    }
    
}