//
//  UILabel+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UILabel: I18n {
    
    func loc_localeDidChange() {
        text = loc_keysDictionary[UILabel.loc_titleKey]?.localised
        accessibilityLabel = loc_keysDictionary[UILabel.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UILabel.loc_accessibilityHintKey]?.localised
    }
    
}
