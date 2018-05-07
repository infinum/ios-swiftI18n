//
//  I18nCaseTransformable.swift
//  Pods-SwiftI18n_Example
//
//  Created by Vlaho Poluta on 07/05/2018.
//

import UIKit

protocol I18nCaseTransformable {
    var caseTransform: String? { get set }
}

extension Localizable where Base: I18nCaseTransformable {
    var caseTransform: I18nCaseTransform? {
        get { return base.caseTransform.flatMap { I18nCaseTransform(rawValue: $0) } }
        set { base.locTitleKey = newValue?.rawValue }
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
