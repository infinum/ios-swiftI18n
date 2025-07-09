//
//  Language.swift
//  SwiftI18n
//
//  Created by Andrija Ostojic on 12.4.25..
//  Copyright © 2025 CocoaPods. All rights reserved.
//

enum Language: String, CaseIterable {
    case english = "en"
    case croatian = "hr"
}

extension Language: Identifiable {
    var id: String { rawValue }
}

extension Language {

    var titleKey: String {
        switch self {
        case .english:
            return "english"
        case .croatian:
            return "croatian"
        }
    }
}
