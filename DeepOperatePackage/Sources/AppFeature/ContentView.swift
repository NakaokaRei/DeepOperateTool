//
//  ContentView.swift
//  
//
//  Created by NakaokaRei on 2022/08/20.
//

import SwiftUI
import Managers

public struct ContentView: View {
    public init() {
        MotionManager().startStream()
    }
    
    public var body: some View {
        Text("Deep Operate")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
