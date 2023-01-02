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
            Text("Mac")
                .padding()
            Button(
                action: {
                    viewModel.send()
                }
            ) {
                Text("send")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
