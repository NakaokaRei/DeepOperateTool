//
//  AppDelegate.swift
//  MacOS
//
//  Created by NakaokaRei on 2022/08/20.
//

import Cocoa
import Foundation
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    
    private var statusItem: NSStatusItem!
    private var popover: NSPopover?

    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.windows.forEach { $0.close() }
        NSApp.setActivationPolicy(.accessory)

        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        let button = statusItem.button!
        button.image = NSImage(systemSymbolName: "leaf", accessibilityDescription: nil)
        button.action = #selector(showPopover)
    }

    @objc func showPopover(_ sender: NSStatusBarButton) {
        if popover == nil {
            let popover = NSPopover()
            popover.behavior = .transient
            popover.animates = false
            popover.contentViewController = NSHostingController(rootView: ContentView())
            self.popover = popover
        }
        popover?.show(relativeTo: sender.bounds, of: sender, preferredEdge: NSRectEdge.maxY)
        popover?.contentViewController?.view.window?.makeKey()
    }
}
