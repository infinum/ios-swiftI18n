//
//  UINavigationItem+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 08/10/2017.
//

import UIKit

public extension UINavigationItem {
    
    static let loc_titleKey = "KEY"
    static let loc_accessibilityLabelKey = "ACCESSIBILITY_LABEL_KEY"
    static let loc_accessibilityHintKey = "ACCESSIBILITY_HINT_KEY"

    @IBInspectable var locTitleKey: String? {
        get {
            loc_keysDictionary[UINavigationItem.loc_titleKey]
        }
        set(newValue) {
            loc_keysDictionary[UINavigationItem.loc_titleKey] = newValue
            loc_localeDidChange()
        }
    }

    @IBInspectable var locAccessibilityLabelKey: String? {
        get {
            loc_keysDictionary[UINavigationItem.loc_accessibilityLabelKey]
        }
        set {
            loc_keysDictionary[UINavigationItem.loc_accessibilityLabelKey] = newValue
            loc_localeDidChange()
        }
    }

    @IBInspectable var locAccessibilityHintKey: String? {
        get {
            loc_keysDictionary[UINavigationItem.loc_accessibilityHintKey]
        }
        set {
            loc_keysDictionary[UINavigationItem.loc_accessibilityHintKey] = newValue
            loc_localeDidChange()
        }
    }
}
