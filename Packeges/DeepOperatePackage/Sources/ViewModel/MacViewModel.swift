//
//  MacViewModel.swift
//  
//
//  Created by NakaokaRei on 2022/08/25.
//

import Foundation
import SwiftUI
import Combine
import Managers
import MultipeerClient

public class MacViewModel: ObservableObject {

    private let multipeerClient = MultipeerClient()

    public init() {}

    public func send() {
        multipeerClient.send(message: "Mac")
    }
}
