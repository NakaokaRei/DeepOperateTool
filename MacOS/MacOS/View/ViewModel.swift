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
import VideoCapture
import HandPoseManager

@MainActor
public class ViewModel: ObservableObject {

    @Published var buffImage: NSImage?
    @Published var thumbTip: CGPoint?
    @Published var indexTip: CGPoint?

    private let videoCapture = VideoCapture()
    private let handPoseManager = HandPoseManager()

    public func startCapture() {
        videoCapture.run { sampleBuffer in
            Task {
                self.buffImage = NSImageFromSampleBuffer(sampleBuffer)
                let result = try await self.handPoseManager.recognize(sampleBuffer)
                self.thumbTip = result.thumbTip
                self.indexTip = result.indexTip
            }
        }
    }
}

extension ViewModel: MulitipeerProtocol {
    public func recievedMessage(message: String) {
        OperateManager.moveMouse(dx: 10, dy: 10)
    }
}
