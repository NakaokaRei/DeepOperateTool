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

public class ViewModel: ObservableObject {

    @Published var buffImage: NSImage?

    private let videoCapture = VideoCapture()

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
