//
//  UILabel+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UIView: I18n {

    @objc func loc_localeDidChange() {
        accessibilityLabel = loc_keysDictionary[Constants.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[Constants.loc_accessibilityHintKey]?.localised
    }
}
