//
//  I18nCaseTransformable.swift
//  Pods-SwiftI18n_Example
//
//  Created by Vlaho Poluta on 07/05/2018.
//

import UIKit

public protocol I18nCaseTransformable {
    var caseTransform: String? { get set }
}

public extension Localizable where Base: I18nCaseTransformable {
    var caseTransform: I18nCaseTransform? {
        get { return base.caseTransform.flatMap { I18nCaseTransform(rawValue: $0) } }
        set { base.caseTransform = newValue?.rawValue }
    }
}

extension UIBarButtonItem: I18nCaseTransformable {}
extension UILabel: I18nCaseTransformable {}
extension UINavigationItem: I18nCaseTransformable {}
extension UITabBarItem: I18nCaseTransformable {}
extension UITextView: I18nCaseTransformable {}
extension UIButton: I18nCaseTransformable {}
extension UITextField: I18nCaseTransformable {}
extension UIViewController: I18nCaseTransformable {}

public extension Localizable where Base: UIButton {
 
    func setCaseTransform(_ key: I18nCaseTransform?, `for` state: UIControlState) {
        base.setCaseTransform(key, for: state)
    }
    
    func caseTransform(`for` state: UIControlState) -> I18nCaseTransform? {
        return base.caseTransform(for: state)
    }
    
}

public extension Localizable where Base: UITextField {
    var caseTransformPlaceholder: I18nCaseTransform? {
        get { return base.casePlaceholderTransform.flatMap { I18nCaseTransform(rawValue: $0) } }
        set { base.casePlaceholderTransform = newValue?.rawValue }
    }
}
