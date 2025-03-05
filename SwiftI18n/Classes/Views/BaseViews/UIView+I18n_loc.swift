//
//  UIView+I18n_loc.swift
//  Pods
//
//  Created by Andrija Ostojic on 19.2.25..
//

import UIKit

public extension UIView {

    internal enum Constants {
        static let loc_accessibilityLabelKey = "ACCESSIBILITY_LABEL_KEY"
        static let loc_accessibilityHintKey = "ACCESSIBILITY_HINT_KEY"
    }

    @IBInspectable var locAccessibilityLabelKey: String? {
        get {
            loc_keysDictionary[Constants.loc_accessibilityLabelKey]
        }
        set(newValue) {
            loc_keysDictionary[Constants.loc_accessibilityLabelKey] = newValue
            loc_localeDidChange()
        }
    }

    @IBInspectable var locAccessibilityHintKey: String? {
        get {
            loc_keysDictionary[Constants.loc_accessibilityHintKey]
        }
        set(newValue) {
            loc_keysDictionary[Constants.loc_accessibilityHintKey] = newValue
            loc_localeDidChange()
        }
    }
}
