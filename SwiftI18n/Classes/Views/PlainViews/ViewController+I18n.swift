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
        guard let title = loc_keysDictionary[UIViewController.loc_titleKey]?.localised else {return}
        self.title = title
    }
    
}
