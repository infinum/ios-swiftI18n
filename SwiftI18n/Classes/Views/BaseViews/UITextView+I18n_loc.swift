//
//  UITextView+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

public extension UITextView {

    static let loc_titleKey = "KEY"

    @IBInspectable var locTitleKey: String? {
        get {
            loc_keysDictionary[UITextView.loc_titleKey]
        }
        set(newValue) {
            loc_keysDictionary[UITextView.loc_titleKey] = newValue
            loc_localeDidChange()
        }
    }
}

