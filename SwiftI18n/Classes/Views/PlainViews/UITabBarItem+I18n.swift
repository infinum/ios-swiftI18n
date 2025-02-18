//
//  UITabBarItem+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 08/10/2017.
//

import UIKit

extension UITabBarItem: I18n {
    
    func loc_localeDidChange() {
        guard let title = loc_keysDictionary[UITabBarItem.loc_titleKey]?.localised else {return}
        self.title = title
    }
    
}
