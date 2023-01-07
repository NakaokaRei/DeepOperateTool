//
//  FingerPointView.swift
//  DeepOperateTool-macOS
//
//  Created by rei.nakaoka on 2023/01/07.
//

import SwiftUI

struct FingerPointView: View {

    let thumbTip: CGPoint
    let indexTip: CGPoint

    var body: some View {
        Group {
            Circle()
                .fill(.blue)
                .frame(width: 20, height: 20)
                .position(thumbTip)
            Circle()
                .fill(.blue)
                .frame(width: 20, height: 20)
                .position(indexTip)
        }
    }
}
