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
import AVFoundation
import MultipeerClient

public class ViewModel: ObservableObject {

    @Published var buffImage: NSImage?

    private let multipeerClient = MultipeerClient()
    private let videoCapture = VideoCapture()

    public init() {
        multipeerClient.delegate = self
    }

    public func send() {
        multipeerClient.send(message: "Mac")
        startCapture()
    }

    public func startCapture() {
        videoCapture.run { sampleBuffer in
            DispatchQueue.main.async {
                self.buffImage = NSImageFromSampleBuffer(sampleBuffer)
            }
        }
    }
}

extension ViewModel: MulitipeerProtocol {
    public func recievedMessage(message: String) {
        OperateManager.moveMouse(dx: 10, dy: 10)
    }
}
