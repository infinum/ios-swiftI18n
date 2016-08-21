//
//  ViewController+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UIViewController: I18n {
    
    private static let loc_titleKey = "KEY"
    
    @IBInspectable public var locTitleKey: String? {
        
        get {
            return loc_keysDictionary[UIViewController.loc_titleKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UIViewController.loc_titleKey] = newValue
            loc_localeDidChanged()
        }
        
    }
    
    #if CASE
    
    private static let case_titleKey = "CKEY"
    
    @IBInspectable public var caseTransform: String? {
    
        get {
            return loc_keysDictionary[UIViewController.case_titleKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UIViewController.case_titleKey] = newValue
            loc_localeDidChanged()
        }
    }
    
    #endif
    
    func loc_localeDidChanged() {
        guard let title = loc_keysDictionary[UIViewController.loc_titleKey]?.localised else {return}
        #if CASE
            let caseTransform = loc_keysDictionary[UIViewController.case_titleKey]
            self.title = title.transform(with: I18nCaseTransform(rawValue: caseTransform ?? ""))
        #else
            self.title = title
        #endif
    }
    
}
