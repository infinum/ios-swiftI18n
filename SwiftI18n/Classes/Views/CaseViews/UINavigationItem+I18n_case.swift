//
//  UINavigationItem+I18n_case.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 08/10/2017.
//

import UIKit

extension UINavigationItem: I18n {
    
    private static let case_titleKey = "CKEY"
    
    @IBInspectable public var caseTransform: String? {
        get {
            loc_keysDictionary[UINavigationItem.case_titleKey]
        }
        set(newValue) {
            loc_keysDictionary[UINavigationItem.case_titleKey] = newValue
            loc_localeDidChange()
        }
    }
    
    func loc_localeDidChange() {
        title = loc_keysDictionary[UINavigationItem.loc_titleKey]?.localised
            .transform(with: I18nCaseTransform(rawValue: loc_keysDictionary[UINavigationItem.case_titleKey] ?? ""))
        accessibilityLabel = loc_keysDictionary[UINavigationItem.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UINavigationItem.loc_accessibilityHintKey]?.localised
    }
}
