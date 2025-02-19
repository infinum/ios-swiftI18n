//
//  UITextView+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

public extension UITextView {

    static let loc_titleKey = "KEY"
    static let loc_accessibilityLabelKey = "ACCESSIBILITY_LABEL_KEY"
    static let loc_accessibilityHintKey = "ACCESSIBILITY_HINT_KEY"

    @IBInspectable var locTitleKey: String? {
        get {
            loc_keysDictionary[UITextView.loc_titleKey]
        }
        set(newValue) {
            loc_keysDictionary[UITextView.loc_titleKey] = newValue
            loc_localeDidChange()
        }
    }

    @IBInspectable var locAccessibilityLabelKey: String? {
        get {
            loc_keysDictionary[UITextView.loc_accessibilityLabelKey]
        }
        set(newValue) {
            loc_keysDictionary[UITextView.loc_accessibilityLabelKey] = newValue
            loc_localeDidChange()
        }
    }

    @IBInspectable var locAccessibilityHintKey: String? {
        get {
            loc_keysDictionary[UITextView.loc_accessibilityHintKey]
        }
        set(newValue) {
            loc_keysDictionary[UITextView.loc_accessibilityHintKey] = newValue
            loc_localeDidChange()
        }
    }
}

