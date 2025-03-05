//
//  UINavigationItem+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 08/10/2017.
//

import UIKit

extension UINavigationItem: I18n {
    
    func loc_localeDidChange() {
        title = loc_keysDictionary[UINavigationItem.loc_titleKey]?.localised
        accessibilityLabel = loc_keysDictionary[UINavigationItem.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UINavigationItem.loc_accessibilityHintKey]?.localised
    }
    
}
