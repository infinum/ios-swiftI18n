//
//  SwiftUIView.swift
//
//
//  Created by Antonijo Bezmalinovic on 14.04.2023..
//

import SwiftUI

enum SwiftI18nKey: EnvironmentKey {
    static var defaultValue: String = I18nManager.instance.language
}

public extension EnvironmentValues {
    
    var language: String {
        get { self[SwiftI18nKey.self] }
        set { self[SwiftI18nKey.self] = newValue }
    }
}

public struct LanguageModifier: ViewModifier {
    
    @State private var language: String
    
    public init(language: String) {
        self.language = language
    }
    
    public func body(content: Content) -> some View {
        content
            .onReceive(
                NotificationCenter.default.publisher(for: .loc_LanguageDidChangeNotification)
            ) { _ in
                language = I18nManager.instance.language
            }
            .environment(\.language, language)
    }
    
}

public struct LocText<S>: View where S: RawRepresentable, S.RawValue == String {
    
    public let key: S
    @Environment(\.language) var language
    
    public var text: Text {
        Text(I18nManager.instance.localizationPerformingBlock(key.rawValue, language))
    }
    
    public var body: some View { text }
}

public extension LocText where S: RawRepresentable, S.RawValue == String {
    
    init(_ key: S) {
        self.key = key
    }
}

public extension LocText {
    
    static func + (lhs: LocText, rhs: LocText) -> Text {
        lhs.text + rhs.text
    }

    static func + (lhs: Text, rhs: LocText) -> Text {
        lhs + rhs.text
    }

    static func + (lhs: LocText, rhs: Text) -> Text {
        lhs.text + rhs
    }
}
