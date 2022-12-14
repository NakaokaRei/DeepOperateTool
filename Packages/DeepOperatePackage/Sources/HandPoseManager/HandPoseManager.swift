//
//  HandPoseManager.swift
//  
//
//  Created by rei.nakaoka on 2023/01/07.
//

import Foundation
import Vision

public class HandPoseManager {
    private var handPoseResquest = VNDetectHumanHandPoseRequest()

    public init() {
        setup()
    }

    func setup() {
        handPoseResquest.maximumHandCount = 1
    }

    public func recognize(_ sampleBuffer: CMSampleBuffer) async throws -> (thumbTip: CGPoint?, indexTip: CGPoint?) {
        var thumbTip: CGPoint?
        var indexTip: CGPoint?

        let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .up, options: [:])
        try handler.perform([handPoseResquest])

        guard let observation = handPoseResquest.results?.first else {
            return (thumbTip, indexTip)
        }

        let thumbPoints = try observation.recognizedPoints(.thumb)
        let indexFingerPoints = try observation.recognizedPoints(.indexFinger)

        guard let thumbTipPoint = thumbPoints[.thumbTip], let indexTipPoint = indexFingerPoints[.indexTip] else {
            return (thumbTip, indexTip)
        }

        guard thumbTipPoint.confidence > 0.3 && indexTipPoint.confidence > 0.3 else {
            return (thumbTip, indexTip)
        }

        thumbTip = CGPoint(x: thumbTipPoint.location.x * 500, y: (1 - thumbTipPoint.location.y) * 500)
        indexTip = CGPoint(x: indexTipPoint.location.x * 500, y: (1 - indexTipPoint.location.y) * 500)

        return (thumbTip, indexTip)
    }
}
