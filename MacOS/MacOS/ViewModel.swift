//
//  ViewModel.swift
//
//
//  Created by NakaokaRei on 2022/08/25.
//

import Foundation
import SwiftUI
import Combine
import MultipeerClient

public class ViewModel: ObservableObject {

    private let multipeerClient = MultipeerClient()

    public init() {
        multipeerClient.delegate = self
    }

    public func send() {
        multipeerClient.send(message: "Mac")
    }

    func HIDPostMediaKey(_ key: Int32) {
        func doMediaKey(_ key: Int, down: Bool) {
            let modifierFlags = NSEvent.ModifierFlags(rawValue: down ? 0xA00 : 0xB00)
            let nsEvent = NSEvent.otherEvent(with: .systemDefined, location: NSPoint(x: 0, y: 0), modifierFlags: modifierFlags, timestamp: 0, windowNumber: 0, context: nil, subtype: 8, data1: (key << 16) | ((down ? 0xA : 0xB) << 8), data2: -1)
            let cgEvent = nsEvent?.cgEvent
            cgEvent?.post(tap: .cghidEventTap)
        }
        doMediaKey(Int(key), down: true)  //key press
        doMediaKey(Int(key), down: false) //key release
    }
}

extension ViewModel: MulitipeerProtocol {
    public func recievedMessage(message: String) {
        HIDPostMediaKey(NX_KEYTYPE_SOUND_UP)
    }
}
