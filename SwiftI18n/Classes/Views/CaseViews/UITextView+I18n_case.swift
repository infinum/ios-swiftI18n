//
//  UITextView+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UITextView: I18n {
    
    private static let case_titleKey = "CKEY"
    
    @IBInspectable public var caseTransform: String? {
        get {
            loc_keysDictionary[UITextView.case_titleKey]
        }
        set(newValue) {
            loc_keysDictionary[UITextView.case_titleKey] = newValue
            loc_localeDidChange()
        }
    }
    
    func loc_localeDidChange() {
        text = loc_keysDictionary[UITextView.loc_titleKey]?.localised
            .transform(with: I18nCaseTransform(rawValue: loc_keysDictionary[UITextView.case_titleKey] ?? "")) ?? ""

        accessibilityLabel = loc_keysDictionary[UITextView.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UITextView.loc_accessibilityHintKey]?.localised
    }
}
