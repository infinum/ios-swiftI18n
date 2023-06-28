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
    
    @State private var language = I18nManager.instance.language
    
    public init(){}

    public func body(content: Content) -> some View {
        content
            .onReceive(
                NotificationCenter.default.publisher(for: .loc_LanguageDidChangeNotification).receive(on: DispatchQueue.main)
            ) { _ in
                language = I18nManager.instance.language
            }
            .environment(\.language, language)
    }
    
}

public struct LocText: View {
    
    public let key: String
    @Environment(\.language) var language
    
    public var text: Text {
        Text(I18nManager.instance.localizationPerformingBlock(key, language))
    }
    
    public var body: some View { text }
}

public extension LocText {
    
    init(_ key: String) {
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
