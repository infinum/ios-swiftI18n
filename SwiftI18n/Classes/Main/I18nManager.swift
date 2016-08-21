//
//  I18nManager.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 17/08/16.
//  Copyright © 2016 Infinum. All rights reserved.
//

import UIKit

public class I18nManager {

    public static var instance = I18nManager()
    
    private init() {}
    
    public var defoultLanguage: String?
    
    private var _availableLanguages: [String]?
    public var availableLanguages: [String] {
        get {
            if let availableLanguages = _availableLanguages {
                return availableLanguages
            }
            let pathsToStrings = Bundle.urls(forResourcesWithExtension: "strings", subdirectory: nil, in: Bundle.main.bundleURL) ?? []
            let availableLanguages = pathsToStrings.flatMap({ (url) -> String? in
                return url.lastPathComponent.components(separatedBy: ".").first
            })
            self._availableLanguages = availableLanguages
            return availableLanguages
        }
        
        set(newValue) {
            _availableLanguages = newValue
        }
    }
    
    private var _language: String?
    public var language: String {
        get {
            if let language = _language {
                return language
            }
            _language = UserDefaults.standard.string(forKey: .langauge)
            if let language = _language {
                return language
            }
            if let defoultLanguage = defoultLanguage {
                return defoultLanguage
            }
            return Bundle.preferredLocalizations(from: availableLanguages).first ?? "en"
        }
        
        set(newValue) {
            _language = newValue
            UserDefaults.standard.set(newValue, forKey: .langauge)
            UserDefaults.standard.set([newValue], forKey: .appleLanguages)
        }
    }
}

public extension I18nManager {
    
    public static func subscribeForLocaleDidChange(block: @escaping ()->()) {
        NotificationCenter.default.addObserver(forName: NSNotification.loc_LanguageDidChangedNotification, object: nil, queue: OperationQueue.main) { _ in
            block()
        }
    }
}

public extension I18nManager {
    
    public func localizedString(forKey key: String) -> String {
        let value = NSLocalizedString(key, tableName: language, comment: "")
        if value == key && defoultLanguage != nil {
            return NSLocalizedString(key, tableName: defoultLanguage, comment: "")
        }
        return value
    }
    
    subscript(locKey: String) -> String {
        return localizedString(forKey: locKey)
    }
}

fileprivate extension I18nManager {
    
    enum I18nUserDefaultKey: String {
        case langauge
        case appleLanguages
    }
    
}

fileprivate extension UserDefaults {
    
    func set(_ value: Any?, forKey key: I18nManager.I18nUserDefaultKey) {
        set(value, forKey: key.rawValue)
    }
    func string(forKey key: I18nManager.I18nUserDefaultKey) -> String? {
        return string(forKey: key.rawValue)
    }
    
}
