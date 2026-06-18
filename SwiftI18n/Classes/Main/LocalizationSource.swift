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
    /// The order of `catalogs` is semantically meaningful: catalogs are searched in the given order and the
    /// first match wins. If the same key exists in more than one catalog, the one listed earlier in the array
    /// takes precedence (e.g. for `["Main", "Settings"]`, a key present in both is resolved from `Main`).
    ///
    /// - Parameter catalogs: The catalog names to look up, i.e. the `.xcstrings` filenames without the extension
    ///   (e.g. `["Main", "Settings"]` for `Main.xcstrings` and `Settings.xcstrings`).
    case stringCatalogs(catalogs: [String])
}
