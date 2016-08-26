//
//  UIButton+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UIButton: I18n {
    
    private static let case_titleKey = "CKEY"
    
    @IBInspectable public var caseTransform: String? {
        
        get {
            return caseTransform(for: .normal)?.rawValue
        }
        
        set(newValue) {
            loc_allStates.forEach { setCaseTransform(I18nCaseTransform(rawValue: newValue ?? ""), for: $0) }
            loc_localeDidChanged()
        }
    }
    
    public func setCaseTransform(_ key: I18nCaseTransform?, `for` state: UIControlState) {
        loc_keysDictionary["\(state)\(UIButton.case_titleKey)"] = key?.rawValue
    }
    
    public func caseTransform(`for` state: UIControlState) -> I18nCaseTransform? {
        return I18nCaseTransform(rawValue: loc_keysDictionary["\(state)\(UIButton.case_titleKey)"] ?? "")
    }
    
    func loc_localeDidChanged() {
        loc_allStates.forEach { loc_localeDidChanged(for: $0) }
    }
    
    func loc_localeDidChanged(`for` state: UIControlState) {
        guard let text = loc_keysDictionary[state]?.localised  else {return}
        let caseTransform = loc_keysDictionary["\(state)\(UIButton.case_titleKey)"]
        setTitle(text.transform(with: I18nCaseTransform(rawValue: caseTransform ?? "")), for: state)
    }
    
}

