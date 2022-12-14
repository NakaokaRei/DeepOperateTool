//
//  ContentView.swift
//  
//
//  Created by NakaokaRei on 2022/08/20.
//

import SwiftUI

public struct ContentView: View {

    @ObservedObject var viewModel = ViewModel()

    public init() {}
    
    public var body: some View {
        VStack {
            Text("iOS")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
