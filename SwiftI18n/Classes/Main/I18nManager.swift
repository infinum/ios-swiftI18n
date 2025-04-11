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
    
    public var defaultLanguage: String?
    public var availableLanguages: [String]?
    
    /// The language code to use as a fallback if a translation is not available in the preferred language.
    ///
    /// **Example**:
    /// ```swift
    /// localizationManager.fallbackLanguage = "en_gb"
    /// ```
    ///
    /// **Important Note**: When `fallbackLanguage` is set, the system will attempt to fetch translations
    /// in this fallback language if the key matches translation in preferred language. This behavior ensures that
    /// missing localizations are substituted with a consistent backup language.
    ///
    /// **Risks**:
    /// - If a localization key is the same as the translation (e.g., common terms like "ok," "done," or "cancel"),
    ///   and the `fallbackLanguage` is not set to English, the system will return a translation in the fallback
    ///   language, even if an appropriate translation exists in the preferred language, this can lead to unintended substitutions. 
    /// To avoid having the issue in the app, use more descriptive translation keys or use case-sensitive words as a translated word (e.g., "ok" != "Ok", "done" != "Done", etc.).
    ///
    /// Setting `fallbackLanguage` should be done with consideration of these potential overrides
    public var fallbackLanguage: String?
    
    public var localizationPerformingBlock: (_ key: String, _ language: String)->(String) = { (key, language) in
        return NSLocalizedString(key, tableName: language, comment: "")
    }

    private var _language: String?
    public var language: String {
        set(newValue) {
            _language = newValue
            UserDefaults.standard.set(newValue, forKey: .language)
            UserDefaults.standard.set([newValue], forKey: .appleLanguages)
            UIApplication.shared.accessibilityLanguage = newValue
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
    
    /// Retrieves a localized string for a given key and language, with fallback mechanisms.
    ///
    /// - Parameters:
    ///   - key: The key for the localized string.
    ///   - language: An optional language code. If `nil`, the method defaults to the instance's language property.
    /// - Returns: The localized string for the specified key and language, or the fallback language if the localization is not found.
    func localizedString(forKey key: String, language: String? = nil) -> String {

        var localizedString = localizationPerformingBlock(key, language ?? self.language)
        
        guard localizedString == key else {
            return localizedString
        }

        guard let fallbackLanguage else {
            return localizedString
        }

        return localizationPerformingBlock(key, fallbackLanguage)
        
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
