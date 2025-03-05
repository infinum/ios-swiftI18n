//
//  ViewController+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UIViewController: I18n {
    
    private static let case_titleKey = "CKEY"
    
    @IBInspectable public var caseTransform: String? {
        get {
            loc_keysDictionary[UIViewController.case_titleKey]
        }
        set(newValue) {
            loc_keysDictionary[UIViewController.case_titleKey] = newValue
            loc_localeDidChange()
        }
    }
    
    func loc_localeDidChange() {
        title = loc_keysDictionary[UIViewController.loc_titleKey]?.localised
            .transform(with: I18nCaseTransform(rawValue: loc_keysDictionary[UIViewController.case_titleKey] ?? ""))

        accessibilityLabel = loc_keysDictionary[UIViewController.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UIViewController.loc_accessibilityHintKey]?.localised
    }
}
