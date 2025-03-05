//
//  UIButton+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

public extension UIButton {

    static let loc_accessibilityLabelKey = "ACCESSIBILITY_LABEL_KEY"
    static let loc_accessibilityHintKey = "ACCESSIBILITY_HINT_KEY"

    @IBInspectable var locTitleKey: String? {
        get {
            locTitleKey(for: .normal)
        }
        set(newValue) {
            loc_allStates.forEach { setLocTitleKey(newValue, for: $0) }
            loc_localeDidChange()
        }
    }
    
    func setLocTitleKey(_ key: String?, `for` state: UIControl.State) {
        loc_keysDictionary[state.rawValue] = key
    }
    
    func locTitleKey(`for` state: UIControl.State) -> String? {
        loc_keysDictionary[state.rawValue]
    }

    @IBInspectable var locAccessibilityLabelKey: String? {
        get {
            loc_keysDictionary[UIButton.loc_accessibilityLabelKey]
        }
        set {
            loc_keysDictionary[UIButton.loc_accessibilityLabelKey] = newValue
            loc_localeDidChange()
        }
    }

    @IBInspectable var locAccessibilityHintKey: String? {
        get {
            loc_keysDictionary[UIButton.loc_accessibilityHintKey]
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
