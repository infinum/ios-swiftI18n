//
//  UITextField+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

public extension UITextField {
    
    @nonobjc static let loc_titleKey = "KEY"
    @nonobjc static let loc_placeholderKey = "PKEY"
    
    @IBInspectable public var locTitleKey: String? {
        
        get {
            return loc_keysDictionary[UITextField.loc_titleKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UITextField.loc_titleKey] = newValue
            loc_localeDidChange()
        }
        
    }
    
    @IBInspectable public var locPlaceholderKey: String? {
        
        get {
            return loc_keysDictionary[UITextField.loc_placeholderKey]
        }
        
        set(newValue) {
            loc_keysDictionary[UITextField.loc_placeholderKey] = newValue
            loc_localeDidChange()
        }
        
    }
    
}
