//
//  UILabel+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UILabel: I18n {
    
    private static let case_titleKey = "CKEY"
    
    @IBInspectable public var caseTransform: String? {
        
        get {
            return loc_keysDictionary[UILabel.case_titleKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UILabel.case_titleKey] = newValue
            loc_localeDidChange()
        }
    }
    
    func loc_localeDidChange() {
        self.text = loc_keysDictionary[UILabel.loc_titleKey]?.localised
            .transform(with: I18nCaseTransform(rawValue: loc_keysDictionary[UILabel.case_titleKey] ?? ""))

        self.accessibilityLabel = loc_keysDictionary[UILabel.loc_accessibilityLabelKey]?.localised
        self.accessibilityHint = loc_keysDictionary[UILabel.loc_accessibilityHintKey]?.localised
    }

}
