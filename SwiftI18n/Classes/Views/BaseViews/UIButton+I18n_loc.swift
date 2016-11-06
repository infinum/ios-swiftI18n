//
//  UIButton+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit


extension UIControlState: Hashable {
    
    public var hashValue: Int {
        return Int(self.rawValue)
    }
    
}

public extension UIButton {
    
    @IBInspectable public var locTitleKey: String? {
        
        get {
            return locTitleKey(for: .normal)
        }
        
        set(newValue) {
            loc_allStates.forEach { setLocTitleKey(newValue, for: $0) }
            loc_localeDidChange()
        }
        
    }
    
    public func setLocTitleKey(_ key: String?, `for` state: UIControlState) {
        loc_keysDictionary[state] = key
    }
    
    public func locTitleKey(`for` state: UIControlState) -> String? {
        return loc_keysDictionary[state]
    }
    
    var loc_allStates: [UIControlState] {
        return [.normal, .disabled, .highlighted, .selected]
    }
    
}

