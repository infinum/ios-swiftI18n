//
//  UIButton+I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

extension UIButton {
    
    private static let case_titleKey = "CKEY"
    
    @IBInspectable public var caseTransform: String? {
        get {
            caseTransform(for: .normal)?.rawValue
        }
        set(newValue) {
            loc_allStates.forEach { setCaseTransform(I18nCaseTransform(rawValue: newValue ?? ""), for: $0) }
            loc_localeDidChange()
        }
    }
    
    public func setCaseTransform(_ key: I18nCaseTransform?, `for` state: UIControl.State) {
        loc_keysDictionary["\(state)\(UIButton.case_titleKey)"] = key?.rawValue
    }
    
    public func caseTransform(`for` state: UIControl.State) -> I18nCaseTransform? {
        return I18nCaseTransform(rawValue: loc_keysDictionary["\(state)\(UIButton.case_titleKey)"] ?? "")
    }
    
    override func loc_localeDidChange() {
        super.loc_localeDidChange()
        loc_allStates.forEach { loc_localeDidChange(for: $0) }
    }
    
    func loc_localeDidChange(`for` state: UIControl.State) {
        guard let text = loc_keysDictionary[state.rawValue]?.localised else {
            setTitle(nil, for: state)
            return
        }
        
        let caseTransform = loc_keysDictionary["\(state)\(UIButton.case_titleKey)"]
        setTitle(text.transform(with: I18nCaseTransform(rawValue: caseTransform ?? "")), for: state)
    }
}
