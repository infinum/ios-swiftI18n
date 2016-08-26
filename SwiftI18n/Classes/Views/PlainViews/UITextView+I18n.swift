//
//  UITextView+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UITextView: I18n {
    
    func loc_localeDidChanged() {
        guard let text = loc_keysDictionary[UITextView.loc_titleKey]?.localised else {return}
        self.text = text
    }
    
}

