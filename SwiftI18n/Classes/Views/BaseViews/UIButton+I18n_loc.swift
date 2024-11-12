//
//  UIButton+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UIControl.State: Hashable {
    
    public var hashValue: Int {
        return Int(self.rawValue)
    }
    
}

public extension UIButton {

    static let loc_accessibilityLabelKey = "ACCESSIBILITY_LABEL_KEY"
    static let loc_accessibilityHintKey = "ACCESSIBILITY_HINT_KEY"

    @IBInspectable var locTitleKey: String? {
        get {
            return locTitleKey(for: .normal)
        }
        
        set(newValue) {
            loc_allStates.forEach { setLocTitleKey(newValue, for: $0) }
            loc_localeDidChange()
        }
    }
    
    func setLocTitleKey(_ key: String?, `for` state: UIControl.State) {
        loc_keysDictionary[state] = key
    }
    
    func locTitleKey(`for` state: UIControl.State) -> String? {
        return loc_keysDictionary[state]
    }

    @IBInspectable var locAccessibilityLabelKey: String? {
        get {
            return loc_keysDictionary[UIButton.loc_accessibilityLabelKey]
        }

        set {
            loc_keysDictionary[UIButton.loc_accessibilityLabelKey] = newValue
            loc_localeDidChange()
        }
    }

    @IBInspectable var locAccessibilityHintKey: String? {
        get {
            return loc_keysDictionary[UIButton.loc_accessibilityHintKey]
        }
        
        set {
            loc_keysDictionary[UIButton.loc_accessibilityHintKey] = newValue
            loc_localeDidChange()
        }
    }

    var loc_allStates: [UIControl.State] {
        return [.normal, .disabled, .highlighted, .selected]
    }
    
}
