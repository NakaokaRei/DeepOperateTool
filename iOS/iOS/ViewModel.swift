//
//  ViewModel.swift
//  
//
//  Created by NakaokaRei on 2022/08/25.
//

import Foundation
import SwiftUI
import Combine
import MultipeerClient

public class ViewModel: ObservableObject {

    private let multipeerClient = MultipeerClient()

    public init() {}

    public func send() {
        multipeerClient.send(message: "iOS")
    }
}
