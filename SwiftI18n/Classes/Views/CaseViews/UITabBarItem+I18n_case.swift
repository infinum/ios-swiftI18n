//
//  UITabBarItem+I18n_case.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 08/10/2017.
//

import UIKit

extension UITabBarItem: I18n {
    
    private static let case_titleKey = "CKEY"
    
    @IBInspectable public var caseTransform: String? {
        
        get {
            return loc_keysDictionary[UITabBarItem.case_titleKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UITabBarItem.case_titleKey] = newValue
            loc_localeDidChange()
        }
    }
    
    func loc_localeDidChange() {
        guard let title = loc_keysDictionary[UITabBarItem.loc_titleKey]?.localised else {return}
        let caseTransform = loc_keysDictionary[UITabBarItem.case_titleKey]
        self.title = title.transform(with: I18nCaseTransform(rawValue: caseTransform ?? ""))
    }
    
}

