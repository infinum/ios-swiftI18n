//
//  UIBarButtonItem+I18n_case.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 08/10/2017.
//

import UIKit

extension UIBarButtonItem: I18n {
    
    private static let case_titleKey = "CKEY"
    
    @IBInspectable public var caseTransform: String? {
        
        get {
            return loc_keysDictionary[UIBarButtonItem.case_titleKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UIBarButtonItem.case_titleKey] = newValue
            loc_localeDidChange()
        }
    }
    
    func loc_localeDidChange() {
        self.title = loc_keysDictionary[UIBarButtonItem.loc_titleKey]?.localised
            .transform(with: I18nCaseTransform(rawValue: loc_keysDictionary[UIBarButtonItem.case_titleKey] ?? ""))
        
        self.accessibilityLabel = loc_keysDictionary[UIBarButtonItem.loc_accessibilityLabelKey]?.localised
        self.accessibilityHint = loc_keysDictionary[UIBarButtonItem.loc_accessibilityHintKey]?.localised
    }

}
