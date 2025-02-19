//
//  UIView+I18n_case.swift
//  Pods
//
//  Created by Andrija Ostojic on 19.2.25..
//

import UIKit

extension UIView: I18n {

    @objc func loc_localeDidChange() {
        accessibilityLabel = loc_keysDictionary[Constants.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[Constants.loc_accessibilityHintKey]?.localised
    }
}

