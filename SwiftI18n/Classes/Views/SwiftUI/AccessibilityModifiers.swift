//
//  AccessibilityModifiers.swift
//  Pods
//
//  Created by Andrija Ostojic on 7. 8. 2025..
//

import SwiftUI

// MARK: - Public setters -

public extension View {

    func setAccessibilityLabel(key: String) -> some View {
        modifier(AccessibilityLabelModifier(key: key))
    }

    func setAccessibilityHint(key: String) -> some View {
        modifier(AccessibilityHintModifier(key: key))
    }
}

// MARK: - Accessibility label modifier -

private struct AccessibilityLabelModifier: ViewModifier {

    @State private var language = I18nManager.instance.language
    let key: String

    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .accessibilityLabel(Text(I18nManager.instance.localizedString(forKey: key, language: language)))
                .modifier(LanguageModifier(didUpdateLanguage: { language = $0 }))
        } else {
            content
                .accessibility(label: Text(I18nManager.instance.localizedString(forKey: key, language: language)))
                .modifier(LanguageModifier(didUpdateLanguage: { language = $0 }))
        }
    }
}

// MARK: - Accessibility hint modifier -

private struct AccessibilityHintModifier: ViewModifier {

    @State private var language = I18nManager.instance.language
    let key: String

    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .accessibilityHint(Text(I18nManager.instance.localizedString(forKey: key, language: language)))
                .modifier(LanguageModifier(didUpdateLanguage: { language = $0 }))
        } else {
            content
                .accessibility(hint: Text(I18nManager.instance.localizedString(forKey: key, language: language)))
                .modifier(LanguageModifier(didUpdateLanguage: { language = $0 }))
        }
    }
}
