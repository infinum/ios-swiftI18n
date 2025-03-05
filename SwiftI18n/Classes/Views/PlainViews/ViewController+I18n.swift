//
//  ViewController+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UIViewController: I18n {
    
    func loc_localeDidChange() {
        title = loc_keysDictionary[UIViewController.loc_titleKey]?.localised
        accessibilityLabel = loc_keysDictionary[UIViewController.loc_accessibilityLabelKey]?.localised
        accessibilityHint = loc_keysDictionary[UIViewController.loc_accessibilityHintKey]?.localised
    }
    
}
