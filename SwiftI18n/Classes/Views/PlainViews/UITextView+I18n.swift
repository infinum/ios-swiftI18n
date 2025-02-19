//
//  UITextView+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UITextView {
    
    override func loc_localeDidChange() {
        text = loc_keysDictionary[UITextView.loc_titleKey]?.localised
        accessibilityLabel = loc_keysDictionary[UITextView.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UITextView.loc_accessibilityHintKey]?.localised
    }
    
}

