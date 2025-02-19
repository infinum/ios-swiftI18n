//
//  UIButton+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UIButton {
    
    func loc_localeDidChange() {
        loc_allStates.forEach { loc_localeDidChange(for: $0) }
        accessibilityLabel = loc_keysDictionary[UIButton.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UIButton.loc_accessibilityHintKey]?.localised
    }
    
    override func loc_localeDidChange(`for` state: UIControl.State) {
        guard let text = loc_keysDictionary[state]?.localised  else { return }
        setTitle(text, for: state)
    }
}

