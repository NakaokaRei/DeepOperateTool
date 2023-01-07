//
//  ContentView.swift
//  
//
//  Created by NakaokaRei on 2022/09/11.
//

import SwiftUI

public struct ContentView: View {

    @ObservedObject var viewModel = ViewModel()

    public init() {}

    public var body: some View {
        VStack {
            if let nsImage = viewModel.buffImage {
                ZStack {
                    Image(nsImage: nsImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 500, height: 500)
                    if let thumbTip = viewModel.thumbTip,
                       let indexTip = viewModel.indexTip {
                        FingerPointView(thumbTip: thumbTip, indexTip: indexTip)
                    }
                }
            }
            Button(action: { viewModel.startCapture() }) {
                Text("start")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
