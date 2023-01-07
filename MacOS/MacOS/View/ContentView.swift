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
                Image(nsImage: nsImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500)
            }
            Button(action: viewModel.startCapture) {
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
