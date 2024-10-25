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

    fileprivate let content: [Content]
    @Environment(\.language) private var language

    public var text: Text {
        content
            .map { $0.text(localizedIn: language) }
            .reduce(Text(""), +)
    }
    
    public var body: some View { text }
}

private extension LocText {

    enum Content {
        case key(String)
        case text(Text)

        func text(localizedIn language: String) -> Text {
            switch self {
            case .key(let key):
                Text(I18nManager.instance.localizedString(forKey: key, language: language))
            case .text(let text):
                text
            }
        }
    }
}


public extension LocText {
    
    init(_ key: String) {
        self.content = [.key(key)]
    }
}

public extension LocText {
    
    static func + (lhs: LocText, rhs: LocText) -> LocText {
        LocText(content: lhs.content + rhs.content)
    }

    static func + (lhs: Text, rhs: LocText) -> LocText {
        LocText(content: [.text(lhs)] + rhs.content)
    }

    static func + (lhs: LocText, rhs: Text) -> LocText {
        LocText(content: lhs.content + [.text(rhs)])
    }
}
