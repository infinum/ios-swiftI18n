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

    let content: [LocTextContent]
    @Environment(\.language) private var language

    public var body: some View {
        content
            .map { $0.text(localizedIn: language) }
            .reduce(Text(""), +)
    }
}

enum LocTextContent {
    case key(String, modifiers: [(Text) -> Text])
    case text(Text)

    func text(localizedIn language: String) -> Text {
        switch self {
        case .key(let key, let modifiers):
            let text = Text(I18nManager.instance.localizationPerformingBlock(key, language))
            return modifiers.reduce(text) { text, modifier in modifier(text) }
        case .text(let text):
            return text
        }
    }
}

public extension LocText {
    
    init(_ key: String) {
        self.content = [.key(key, modifiers: [])]
    }
}
