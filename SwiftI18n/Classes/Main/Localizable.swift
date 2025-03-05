//
//  I18n.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/04/18.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

public struct Localizable<Base: LocKeyAcceptable> {
    public var base: Base
}

public protocol LocKeyAcceptable: AnyObject {
    var locTitleKey: String? { get set }
}

public protocol AccessibilityLocKeyAcceptable: AnyObject {
    var locAccessibilityLabelKey: String? { get set }
    var locAccessibilityHintKey: String? { get set }
}

public extension LocKeyAcceptable {
    var loc: Localizable<Self> {
        get { return Localizable(base: self) }
        set { }
    }
}

// MARK: - Conforming views -

// MARK: - UIView

extension UIView: AccessibilityLocKeyAcceptable {}

// MARK: - UIView subviews

extension UILabel: LocKeyAcceptable {}
extension UITextView: LocKeyAcceptable {}
extension UIButton: LocKeyAcceptable {}
extension UITextField: LocKeyAcceptable {}
extension UISearchBar: LocKeyAcceptable {}

// MARK: - Views that are not subviews of UIView

extension UIBarButtonItem: LocKeyAcceptable & AccessibilityLocKeyAcceptable {}
extension UINavigationItem: LocKeyAcceptable & AccessibilityLocKeyAcceptable {}
extension UITabBarItem: LocKeyAcceptable & AccessibilityLocKeyAcceptable {}
extension UIViewController: LocKeyAcceptable & AccessibilityLocKeyAcceptable {}
