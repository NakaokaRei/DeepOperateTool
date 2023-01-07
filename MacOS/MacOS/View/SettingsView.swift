//
//  SettingsView.swift
//  DeepOperateTool-macOS
//
//  Created by rei.nakaoka on 2023/01/07.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @State private var someString = ""
    @State private var useSomething = false

    var body: some View {
        Form {
            TextField("Some string", text: $someString)
            Toggle("Use something", isOn: $useSomething)
        }
        .padding(5)
    }
}
