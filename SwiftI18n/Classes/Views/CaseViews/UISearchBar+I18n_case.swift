//
//  UISearchBar+I18n_case.swift
//  Pods-SwiftI18n_Example
//
//  Created by Goran Brlas on 22/01/2019.
//

import UIKit

extension UISearchBar {
    
    private static let case_titleKey = "CKEY"
    private static let case_placeholderKey = "CPKEY"
    
    @IBInspectable public var caseTransform: String? {
        get {
            loc_keysDictionary[UISearchBar.case_titleKey]
        }
        set(newValue) {
            loc_keysDictionary[UISearchBar.case_titleKey] = newValue
            loc_localeDidChange()
        }
    }
    
    @IBInspectable public var casePlaceholderTransform: String? {
        get {
            loc_keysDictionary[UISearchBar.case_placeholderKey]
        }
        set(newValue) {
            loc_keysDictionary[UISearchBar.case_placeholderKey] = newValue
            loc_localeDidChange()
        }
    }
    
    override func loc_localeDidChange() {
        super.loc_localeDidChange()
        text = loc_keysDictionary[UISearchBar.loc_titleKey]?.localised
            .transform(with: I18nCaseTransform(rawValue: loc_keysDictionary[UISearchBar.case_titleKey] ?? ""))
        placeholder = loc_keysDictionary[UISearchBar.loc_placeholderKey]?.localised
            .transform(with: I18nCaseTransform(rawValue: loc_keysDictionary[UISearchBar.case_placeholderKey] ?? ""))
    }
}
