//
//  UIButton+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UIButton: I18n {
    
    func loc_localeDidChange() {
        loc_allStates.forEach { loc_localeDidChange(for: $0) }
    }
    
    func loc_localeDidChange(`for` state: UIControlState) {
        guard let text = loc_keysDictionary[state]?.localised  else {return}
        setTitle(text, for: state)
    }
    
}

