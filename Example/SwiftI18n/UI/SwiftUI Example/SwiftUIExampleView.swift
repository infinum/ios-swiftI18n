//
//  SwiftUIExampleView.swift
//  SwiftI18n_Example
//
//  Created by Andrija Ostojic on 12.4.25..
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import SwiftUI
import SwiftI18n

struct SwiftUIExampleView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                LocText("basic_example")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                LocText("fallback_language")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                LocText("fallback_language_example")
                Divider()
                LocText("button_example")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button(action: { }) {
                    LocText("useless_button")
                        .padding(EdgeInsets(top: 12, leading: 32, bottom: 12, trailing: 32))
                        .background(Color.blue)
                        .foregroundStyle(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 32, leading: 16, bottom: 32, trailing: 16))
        }
    }
}
