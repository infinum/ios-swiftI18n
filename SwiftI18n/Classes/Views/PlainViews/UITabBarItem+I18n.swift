//
//  UITabBarItem+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 08/10/2017.
//

import UIKit

extension UITabBarItem: I18n {
    
    func loc_localeDidChange() {
        title = loc_keysDictionary[UITabBarItem.loc_titleKey]?.localised
        accessibilityLabel = loc_keysDictionary[UITabBarItem.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UITabBarItem.loc_accessibilityHintKey]?.localised
    }
    
}
