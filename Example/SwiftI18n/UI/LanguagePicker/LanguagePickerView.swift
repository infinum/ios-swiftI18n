//
//  LanguagePickerView.swift
//  SwiftI18n_Example
//
//  Created by Andrija Ostojic on 12.4.25..
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import SwiftUI
import SwiftI18n

struct LanguagePickerView: View {

    var body: some View {
        VStack(spacing: 8) {
            LocText("choose_language")
                .font(.system(size: 24))
                .padding(.top, 24)
            Spacer()
            ForEach(Language.allCases) { language in
                Button(action: {
                    I18nManager.instance.language = language.rawValue
                }) {
                    pickerListItem(titleKey: language.titleKey)
                }
            }
            Spacer()
        }
        .background(Color.white)
    }
}

// MARK: - Subviews -

extension LanguagePickerView {

    func pickerListItem(titleKey: String) -> some View {
        LocText(titleKey)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(16)
            .foregroundStyle(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.black, lineWidth: 1)
            )
            .padding(.horizontal, 24)
    }
}

#Preview {
    LanguagePickerView()
}
