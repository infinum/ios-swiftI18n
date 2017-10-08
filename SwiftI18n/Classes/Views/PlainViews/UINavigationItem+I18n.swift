//
//  UINavigationItem+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 08/10/2017.
//

import UIKit

extension UINavigationItem: I18n {
    
    func loc_localeDidChange() {
        guard let title = loc_keysDictionary[UILabel.loc_titleKey]?.localised else {return}
        self.title = title
    }
    
}
