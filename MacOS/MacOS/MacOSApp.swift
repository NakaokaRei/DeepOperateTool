//
//  MacOSApp.swift
//  MacOS
//
//  Created by NakaokaRei on 2022/08/20.
//

import Cocoa
import SwiftUI
import AppFeature

@main
struct MacOSApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MacContentView()
        }
    }
}
