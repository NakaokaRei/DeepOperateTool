//
//  MacContentView.swift
//  
//
//  Created by NakaokaRei on 2022/08/25.
//

import SwiftUI
import ViewModel

public struct MacContentView: View {

    @ObservedObject var viewModel = MacViewModel()

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
        MacContentView()
    }
}
