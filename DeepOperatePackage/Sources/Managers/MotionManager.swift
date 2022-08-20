//
//  MotionManager.swift
//  
//
//  Created by NakaokaRei on 2022/08/20.
//

import Foundation
import CoreMotion

public class MotionManager {

//    let hmm = CMHeadphoneMotionManager()

    public init() {
        startStream()
    }

    public func startStream() {
        print("start")
//        hmm.startDeviceMotionUpdates(to: .main) { (motion, error) in
//            guard let motion = motion else { return }
//            print(motion)
//        }
    }
}
