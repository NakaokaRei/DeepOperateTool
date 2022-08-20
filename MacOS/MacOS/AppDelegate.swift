//
//  AppDelegate.swift
//  MacOS
//
//  Created by NakaokaRei on 2022/08/20.
//

import Cocoa
import Foundation

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        let button = statusItem.button!
        button.image = NSImage(systemSymbolName: "leaf", accessibilityDescription: nil)
    }
}
