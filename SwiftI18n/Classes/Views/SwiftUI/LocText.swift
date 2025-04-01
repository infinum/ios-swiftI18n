//
//  SwiftUIView.swift
//
//
//  Created by Antonijo Bezmalinovic on 14.04.2023..
//

import SwiftUI

private struct AcessibilityLabelModifier: ViewModifier {
    let key: String

    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .accessibilityLabel(Text(I18nManager.instance.localizedString(forKey: key, language: I18nManager.instance.language)))
        } else {
            content
                .accessibility(label: Text(I18nManager.instance.localizedString(forKey: key, language: I18nManager.instance.language)))
        }
    }
}

private struct AcessibilityHintModifier: ViewModifier {
    let key: String

    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .accessibilityHint(Text(I18nManager.instance.localizedString(forKey: key, language: I18nManager.instance.language)))
        } else {
            content
                .accessibility(hint: Text(I18nManager.instance.localizedString(forKey: key, language: I18nManager.instance.language)))
        }
    }
}

public extension View {
    func setAcessibilityLabel(key: String) -> some View {
        modifier(AcessibilityLabelModifier(key: key))
    }

    func setAcessibilityHint(key: String) -> some View {
        modifier(AcessibilityHintModifier(key: key))
    }
}

public struct LanguageModifier: ViewModifier {

    private let didUpdatedLanguage: (String) -> Void

    public init(didUpdatedLanguage: @escaping (String) -> Void){
        self.didUpdatedLanguage = didUpdatedLanguage
    }

    public func body(content: Content) -> some View {
        content
            .onReceive(
                NotificationCenter.default.publisher(for: .loc_LanguageDidChangeNotification).receive(on: DispatchQueue.main)
            ) { _ in
                didUpdatedLanguage(I18nManager.instance.language)
            }
    }
}

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
            .modifier(LanguageModifier(didUpdatedLanguage: { language = $0 }))
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
