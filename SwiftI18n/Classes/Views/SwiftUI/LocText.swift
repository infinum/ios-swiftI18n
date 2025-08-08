//
//  SwiftUIView.swift
//
//
//  Created by Antonijo Bezmalinovic on 14.04.2023..
//

import SwiftUI

public struct LocText: View {

    fileprivate let content: [Content]
    @State private var language = I18nManager.instance.language

    public var text: Text {
        content
            .map { $0.text(localizedIn: language) }
            .reduce(Text(""), +)
    }

    public var body: some View {
        text
            .modifier(LanguageModifier(didUpdateLanguage: { language = $0 }))
            .environment(\.locale, Locale(identifier: language))
    }
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
