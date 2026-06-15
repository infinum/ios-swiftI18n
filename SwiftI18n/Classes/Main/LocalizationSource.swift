//
//  LocalizationSource.swift
//  SwiftI18n
//
//  Created by Andrija Ostojic on 12. 5. 2026..
//

/// Determines how ``I18nManager`` resolves localized strings.
public enum LocalizationSource {

    /// Resolves strings using the legacy `NSLocalizedString` lookup, with one `.strings` table per language.
    case stringsFiles

    /// Resolves strings from one or more String Catalogs (`.xcstrings`).
    ///
    /// - Parameter catalogs: The catalog names to look up, i.e. the `.xcstrings` filenames without the extension
    ///   (e.g. `["Main", "Settings"]` for `Main.xcstrings` and `Settings.xcstrings`).
    case stringCatalogs(catalogs: [String])
}
