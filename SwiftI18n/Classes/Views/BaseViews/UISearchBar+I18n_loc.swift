//
//  UISearchBar+I18n_loc.swift
//  Pods-SwiftI18n_Example
//
//  Created by Goran Brlas on 22/01/2019.
//

import UIKit

public extension UISearchBar {
    
    static let loc_titleKey = "KEY"
    static let loc_placeholderKey = "PKEY"
    static let loc_accessibilityLabelKey = "ACCESSIBILITY_LABEL_KEY"
    static let loc_accessibilityHintKey = "ACCESSIBILITY_HINT_KEY"

    @IBInspectable var locTitleKey: String? {
        get {
            return loc_keysDictionary[UISearchBar.loc_titleKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UISearchBar.loc_titleKey] = newValue
            loc_localeDidChange()
        }
    }
    
    @IBInspectable var locPlaceholderKey: String? {
        get {
            return loc_keysDictionary[UISearchBar.loc_placeholderKey]
        }

        set(newValue) {
            loc_keysDictionary[UISearchBar.loc_placeholderKey] = newValue
            loc_localeDidChange()
        }
    }
    @IBInspectable var locAccessibilityLabelKey: String? {
        get {
            return loc_keysDictionary[UISearchBar.loc_accessibilityLabelKey]
        }

        set(newValue) {
            loc_keysDictionary[UISearchBar.loc_accessibilityLabelKey] = newValue
            loc_localeDidChange()
        }
    }

    @IBInspectable var locAccessibilityHintKey: String? {
        get {
            return loc_keysDictionary[UISearchBar.loc_accessibilityHintKey]
        }
        set(newValue) {
            loc_keysDictionary[UISearchBar.loc_accessibilityHintKey] = newValue
            loc_localeDidChange()
        }
    }

}
