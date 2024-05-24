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
    
    public var overrideToFallbackLanguage = false
    public var fallbackLanguage: String?
    
    private init() {}
    
    public var defaultLanguage: String?
    public var availableLanguages: [String]?
    
    public lazy var localizationPerformingBlock: (_ key: String, _ language: String)->(String) = { [weak self] (key, language) in
        guard let self else { return "" }
        let translation = NSLocalizedString(key, tableName: language, comment: "")
        
        guard translation == key else {
            return translation
        }

        guard let fallbackLanguage, overrideToFallbackLanguage else {
            return translation
        }
        
        return NSLocalizedString(key, tableName: fallbackLanguage, comment: "")
    }
    
    private var _language: String?
    public var language: String {
        set(newValue) {
            _language = newValue
            UserDefaults.standard.set(newValue, forKey: .language)
            UserDefaults.standard.set([newValue], forKey: .appleLanguages)
            NotificationCenter.default.post(name: .loc_LanguageDidChangeNotification, object: nil)
        }
        get {
            if let language = _language {
                return language
            }
            _language = UserDefaults.standard.string(forKey: .language)
            if let language = _language {
                return language
            }
            if let defaultLanguage = defaultLanguage {
                return defaultLanguage
            }
            return availableLanguages
                .flatMap { return Bundle.preferredLocalizations(from: $0, forPreferences: Locale.preferredLanguages).first }
                ?? "en"
        }
    }
}

public extension I18nManager {
    
    static func subscribeForLocaleDidChange(block: @escaping ()->()) -> NSObjectProtocol {
        return NotificationCenter.default.addObserver(forName: .loc_LanguageDidChangeNotification, object: nil, queue: OperationQueue.main) { _ in
            block()
        }
    }
}

public extension I18nManager {
    
    func localizedString(forKey key: String) -> String {
        return localizationPerformingBlock(key, language)
    }
    
    subscript(locKey: String) -> String {
        return localizedString(forKey: locKey)
    }
}

fileprivate extension I18nManager {
    
    enum I18nUserDefaultKey: String {
        case language
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
