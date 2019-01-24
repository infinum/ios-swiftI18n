//
//  UISearchBar+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 24/01/2019.
//

import UIKit

extension UISearchBar: I18n {

    func loc_localeDidChange() {
        let text = loc_keysDictionary[UITextField.loc_titleKey]?.localised
        let placeholder = loc_keysDictionary[UITextField.loc_placeholderKey]?.localised
        
        if let text = text {
            self.text = text
        }
        
        if let placeholder = placeholder {
            self.placeholder = placeholder
        }
    }

}
