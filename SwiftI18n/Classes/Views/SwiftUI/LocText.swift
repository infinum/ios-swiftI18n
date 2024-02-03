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

    var content: [LocTextContent]
    @Environment(\.language) private var language

    public var body: some View {
        content
            .map { $0.text(localizedIn: language) }
            .reduce(Text(""), +)
    }
}

struct LocTextContent {
    let key: LocTextContentKey
    var modifiers: [(Text) -> Text]

    func text(localizedIn language: String) -> Text {
        modifiers.reduce(key.text(localizedIn: language)) { text, modifier in modifier(text) }
    }

    static func text(_ text: Text) -> Self {
        LocTextContent(key: .text(text), modifiers: [])
    }

    static func key(_ key: String) -> Self {
        LocTextContent(key: .key(key), modifiers: [])
    }
}

enum LocTextContentKey {
    case key(String)
    case text(Text)

    func text(localizedIn language: String) -> Text {
        switch self {
        case .key(let key): Text(I18nManager.instance.localizationPerformingBlock(key, language))
        case .text(let text):  text
        }
    }
}

public extension LocText {
    
    init(_ key: String) {
        self.content = [.key(key)]
    }
}
