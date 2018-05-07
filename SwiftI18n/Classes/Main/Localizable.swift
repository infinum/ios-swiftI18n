//
//  Localizable.swift
//  Pods-SwiftI18n_Example
//
//  Created by Vlaho Poluta on 07/05/2018.
//

import Foundation

struct Localizable<Base: LocKeyAcceptable> {
    var base: Base
}

protocol LocKeyAcceptable {
    var locTitleKey: String? { get set }
}

extension LocKeyAcceptable {
    var loc: Localizable<Self> {
        get { return Localizable(base: self) }
        set {}
    }
}

