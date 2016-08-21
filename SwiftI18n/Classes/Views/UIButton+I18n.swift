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

extension UIButton: I18n {
    
    @IBInspectable public var locTitleKey: String? {
        
        get {
            return locTitleKey(for: .normal)
        }
        
        set(newValue) {
            loc_allStates.forEach { setLocTitleKey(newValue, for: $0) }
            loc_localeDidChanged()
        }
        
    }
    
    public func setLocTitleKey(_ key: String?, `for` state: UIControlState) {
        loc_keysDictionary[state] = key
    }
    
    public func locTitleKey(`for` state: UIControlState) -> String? {
        return loc_keysDictionary[state]
    }
    
    #if CASE
    
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
    
    #endif
    
    
    private var loc_allStates: [UIControlState] {
        return [.normal, .disabled, .highlighted, .selected]
    }
    
    func loc_localeDidChanged() {
        loc_allStates.forEach { loc_localeDidChanged(for: $0) }
    }
    
    func loc_localeDidChanged(`for` state: UIControlState) {
        guard let text = loc_keysDictionary[state]?.localised  else {return}
        #if CASE
            let caseTransform = loc_keysDictionary["\(state)\(UIButton.case_titleKey)"]
            setTitle(text.transform(with: I18nCaseTransform(rawValue: caseTransform ?? "")), for: state)
        #else
            setTitle(text, for: state)
        #endif
    }
    
}

