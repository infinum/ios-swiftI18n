//
//  UISearchBar+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 24/01/2019.
//

import UIKit

extension UISearchBar {

    override func loc_localeDidChange() {
        text = loc_keysDictionary[UISearchBar.loc_titleKey]?.localised
        placeholder = loc_keysDictionary[UISearchBar.loc_placeholderKey]?.localised
        accessibilityLabel = loc_keysDictionary[UISearchBar.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UISearchBar.loc_accessibilityHintKey]?.localised
    }

}
