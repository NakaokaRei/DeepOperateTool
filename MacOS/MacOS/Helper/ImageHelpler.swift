//
//  ImageHelpler.swift
//  DeepOperateTool-macOS
//
//  Created by rei.nakaoka on 2023/01/07.
//

import Foundation
import AVFoundation
import Cocoa

func NSImageFromSampleBuffer(_ sampleBuffer: CMSampleBuffer) -> NSImage? {
    guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
        return nil
    }

    let ciImage = CIImage(cvImageBuffer: pixelBuffer)
    let context = CIContext(options: nil)
    let width = CVPixelBufferGetWidth(pixelBuffer)
    let height = CVPixelBufferGetHeight(pixelBuffer)

    guard let cgImage = context.createCGImage(ciImage, from: CGRect(x: 0, y: 0, width: width, height: height)) else {
        return nil
    }

    let nsImage = NSImage(cgImage: cgImage, size: CGSize(width: width, height: height))
    return nsImage
}
