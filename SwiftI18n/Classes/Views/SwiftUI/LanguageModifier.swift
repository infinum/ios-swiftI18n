//
//  LanguageModifier.swift
//  Pods
//
//  Created by Andrija Ostojic on 7. 8. 2025..
//

import SwiftUI

public struct LanguageModifier: ViewModifier {

    private let didUpdateLanguage: (String) -> Void

    public init(didUpdateLanguage: @escaping (String) -> Void){
        self.didUpdateLanguage = didUpdateLanguage
    }

    public func body(content: Content) -> some View {
        content
            .onReceive(
                NotificationCenter.default.publisher(for: .loc_LanguageDidChangeNotification).receive(on: DispatchQueue.main)
            ) { _ in
                didUpdateLanguage(I18nManager.instance.language)
            }
    }
}
