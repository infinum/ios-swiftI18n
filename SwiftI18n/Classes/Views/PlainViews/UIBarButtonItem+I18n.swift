//
//  UIBarButtonItem+I18n.swift
//  Pods-SwiftI18n_Example
//
//  Created by Vlaho Poluta on 08/10/2017.
//

import UIKit

extension UIBarButtonItem: I18n {
    
    func loc_localeDidChange() {
        title = loc_keysDictionary[UIBarButtonItem.loc_titleKey]?.localised
        accessibilityLabel = loc_keysDictionary[UIBarButtonItem.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UIBarButtonItem.loc_accessibilityHintKey]?.localised
    }
}
