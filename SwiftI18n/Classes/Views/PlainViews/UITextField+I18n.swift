//
//  UITextField+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UITextField {
    
    override func loc_localeDidChange() {
        super.loc_localeDidChange()
        text = loc_keysDictionary[UITextField.loc_titleKey]?.localised
        placeholder = loc_keysDictionary[UITextField.loc_placeholderKey]?.localised
    }
    
}
