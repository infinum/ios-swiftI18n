//
//  UIBarButtonItem+I18n.swift
//  Pods-SwiftI18n_Example
//
//  Created by Vlaho Poluta on 08/10/2017.
//

import UIKit

extension UIBarButtonItem: I18n {
    
    func loc_localeDidChange() {
        guard let title = loc_keysDictionary[UIBarButtonItem.loc_titleKey]?.localised else {return}
        self.title = title
    }
    
}
