//
//  LocText.swift
//  EmergencyApp
//
//  Created by Lucija Balja on 29.08.2022..
//  Copyright © 2022 Signify. All rights reserved.
//
​
import SwiftUI
​
enum SwiftI18nKey: EnvironmentKey {
    static var defaultValue: String = LocalizationManager.shared.getLocale()
}
​
public extension EnvironmentValues {
    var language: String {
        get { self[SwiftI18nKey.self] }
        set { self[SwiftI18nKey.self] = newValue }
    }
}
​
public struct LanguageModifier: ViewModifier {
​
    @State private var language: String
    private let userId: String
​
    init(language: String, userId: String) {
        self.language = language
        self.userId = userId
    }
​
    init(userId: String) {
        self.userId = userId
        self._language = State(wrappedValue: LocalizationManager.shared.getLocale(for: userId))
    }
​
    public func body(content: Content) -> some View {
        content
            .onReceive(
                NotificationCenter.default.publisher(for: .loc_LanguageDidChangeNotification)
            ) { _ in
                language = LocalizationManager.shared.getLocale(for: userId)
            }
            .environment(\.language, language)
    }
​
}
​
public struct LocText<S>: View where S: StringsProtocol, S.RawValue == String {
​
    public let key: S
    @Environment(\.language) var language
​
    public var text: Text {
        Text(I18nManager.instance.localizationPerformingBlock(key.rawValue, language))
    }
​
    public var body: some View { text }
}
​
public extension LocText where S == Strings {
​
    init(_ key: Strings) {
        self.key = key
    }
​
}
​
public extension LocText {
​
    static func + (lhs: LocText, rhs: LocText) -> Text {
        lhs.text + rhs.text
    }
​
    static func + (lhs: Text, rhs: LocText) -> Text {
        lhs + rhs.text
    }
​
    static func + (lhs: LocText, rhs: Text) -> Text {
        lhs.text + rhs
    }
}
