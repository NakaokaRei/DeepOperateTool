//
//  OperateManager.swift
//
//
//  Created by NakaokaRei on 2022/08/20.
//

import Foundation
import Cocoa
import AppKit

class OperateManager {

    static func doKey(_ key: CGKeyCode, keyDown: Bool, modifierFlags: CGEventFlags) {
        let source = CGEventSource(stateID: .hidSystemState)
        let event = CGEvent(keyboardEventSource: source, virtualKey: key, keyDown: keyDown)
        event?.flags = modifierFlags
        event?.post(tap: .cghidEventTap)
    }

    static func keyDown(_ key: CGKeyCode, modifierFlags: CGEventFlags = []) {
        doKey(key, keyDown: true, modifierFlags: modifierFlags)
    }

    static func keyUp(_ key: CGKeyCode, modifierFlags: CGEventFlags = []) {
        doKey(key, keyDown: false, modifierFlags: modifierFlags)
    }

    static func keyDownAndUp(_ key: CGKeyCode, modifierFlags: CGEventFlags = []) {
        keyDown(key, modifierFlags: modifierFlags)
        keyUp(key, modifierFlags: modifierFlags)
    }

    static func moveMouse(dx: CGFloat, dy: CGFloat) {
        var location = NSEvent.mouseLocation
        for screen in NSScreen.screens {
            if screen.frame.contains(location) {
                location = CGPoint(x: location.x, y: NSHeight(screen.frame) - location.y)
                location = CGPoint(x: location.x - dx, y: location.y + dy)
                CGDisplayMoveCursorToPoint(0, location)
                break
            }
        }
    }

    static func leftClickDown(position: CGPoint) {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(mouseEventSource: source, mouseType: CGEventType.leftMouseDown,
                            mouseCursorPosition: position, mouseButton: CGMouseButton.left)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }

    static func leftClickUp(position: CGPoint) {
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(mouseEventSource: source, mouseType: CGEventType.leftMouseUp,
                            mouseCursorPosition: position, mouseButton: CGMouseButton.left)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
    }

    static func leftDragged(to: CGPoint, from: CGPoint) {
        leftClickDown(position: from)
        let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
        let event = CGEvent(mouseEventSource: source, mouseType: CGEventType.leftMouseDragged,
                            mouseCursorPosition: to, mouseButton: CGMouseButton.left)
        event?.post(tap: CGEventTapLocation.cghidEventTap)
        leftClickUp(position: to)
    }
}
