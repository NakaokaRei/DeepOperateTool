//
//  ViewModel.swift
//
//
//  Created by NakaokaRei on 2022/08/25.
//

import Foundation
import SwiftUI
import Combine
import Cocoa
import MultipeerClient

public class ViewModel: ObservableObject {

    private let multipeerClient = MultipeerClient()

    public init() {
        multipeerClient.delegate = self
    }

    public func send() {
        multipeerClient.send(message: "Mac")
    }
}

extension ViewModel: MulitipeerProtocol {
    public func recievedMessage(message: String) {
        OperateManager.moveMouse(dx: 10, dy: 10)
    }
}
