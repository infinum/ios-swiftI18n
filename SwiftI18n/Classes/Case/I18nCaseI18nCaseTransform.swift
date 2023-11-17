//
//  I18nCase.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 18/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

public enum I18nCaseTransform: String {
    
    case uppercased = "up"
    case lowercased = "low"
    case capitalized = "cap"
    case firstCapitalized = "firstCap"
    
    func transform(string: String) -> String {
        switch self {
        case .uppercased:
            return string.uppercased()
        case .lowercased:
            return string.lowercased()
        case .capitalized:
            return string.capitalized(with: Locale(identifier: I18nManager.instance.language))
        case .firstCapitalized:
            return String(string.uppercased().prefix(1) + string.lowercased().dropFirst())
        }
    }
}

extension String {
    
    func transform(with caseTransform: I18nCaseTransform?) -> String {
        guard let caseTransform = caseTransform else { return self }
        return caseTransform.transform(string: self)
    }
    
}


