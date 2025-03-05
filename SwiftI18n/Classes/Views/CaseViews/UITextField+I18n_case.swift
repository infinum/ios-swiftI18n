//
//  UITextField+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UITextField: I18n {
    
    private static let case_titleKey = "CKEY"
    private static let case_placeholderKey = "CPKEY"
    
    @IBInspectable public var caseTransform: String? {
        get {
            loc_keysDictionary[UITextField.case_titleKey]
        }
        set(newValue) {
            loc_keysDictionary[UITextField.case_titleKey] = newValue
            loc_localeDidChange()
        }
    }
    
    @IBInspectable public var casePlaceholderTransform: String? {
        get {
            loc_keysDictionary[UITextField.case_placeholderKey]
        }
        set(newValue) {
            loc_keysDictionary[UITextField.case_placeholderKey] = newValue
            loc_localeDidChange()
        }
    }
    
    func loc_localeDidChange() {
        text = loc_keysDictionary[UITextField.loc_titleKey]?.localised
            .transform(with: I18nCaseTransform(rawValue: loc_keysDictionary[UITextField.case_titleKey] ?? ""))
        placeholder = loc_keysDictionary[UITextField.loc_placeholderKey]?.localised
            .transform(with: I18nCaseTransform(rawValue: loc_keysDictionary[UITextField.case_placeholderKey] ?? ""))
        accessibilityLabel = loc_keysDictionary[UITextField.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UITextField.loc_accessibilityHintKey]?.localised
    }
}
