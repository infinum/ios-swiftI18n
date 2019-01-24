//
//  I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/04/18.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit
import SwiftI18n

extension String {
    
    public var localized: String {
        return localised
    }
    
    public func localizedFormat(with args: CVarArg...) -> String {
        return String(format: self.localised, arguments: args)
    }
}

extension Language: Equatable {
    
    static func == (lhs: Language, rhs: Language) -> Bool {
        return lhs.languageCode == rhs.languageCode
    }
    
}

extension Localizable {
    
    var titleKey: Strings? {
        get { return base.locTitleKey.flatMap { Strings(rawValue: $0) } }
        set { base.locTitleKey = newValue?.rawValue }
    }
    
}

extension Localizable where Base: UIButton {
    
    func titleKey(for state: UIControl.State) -> Strings? {
        return base.locTitleKey(for: state).flatMap { Strings(rawValue: $0) }
    }
    
    func setTitleKey(_ key: Strings, for state: UIControl.State) {
        return base.setLocTitleKey(key.rawValue, for: state)
    }
}

extension Localizable where Base: UITextField {
    
    var placeholderKey: Strings? {
        get { return base.locPlaceholderKey.flatMap { Strings(rawValue: $0) } }
        set { base.locPlaceholderKey = newValue?.rawValue }
    }
}

extension Localizable where Base: UISearchBar {
    
    var placeholderKey: Strings? {
        get { return base.locPlaceholderKey.flatMap { Strings(rawValue: $0) } }
        set { base.locPlaceholderKey = newValue?.rawValue }
    }
}
