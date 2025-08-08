//
//  LocTextViewExtensions.swift
//  Pods
//
//  Created by Milos on 8. 8. 2025..
//

import SwiftUI

// MARK: - Menu -

@available(iOS 14.0, *)
public extension Menu where Label == LocText {
    init(locTitleKey: String, @ViewBuilder content: @escaping () -> Content) {
        self.init {
            content()
        } label: {
            LocText(locTitleKey)
        }
    }
}

// MARK: - Button -

public extension Button where Label == LocText {
    init(locTitleKey: String, action: @escaping () -> Void) {
        self.init(action: action) {
            LocText(locTitleKey)
        }
    }

    @available(iOS 15.0, *)
    init(role: ButtonRole?, locTitleKey: String, action: @escaping () -> Void) {
        self.init(role: role, action: action) {
            LocText(locTitleKey)
        }
    }
}

// MARK: - Label -

@available(iOS 14.0, *)
public extension Label where Title == LocText, Icon == EmptyView {
    init(locTitleKey: String) {
        self.init {
            LocText(locTitleKey)
        } icon: {
            EmptyView()
        }
    }
}

@available(iOS 14.0, *)
public extension Label where Title == LocText, Icon == Image {
    init(locTitleKey: String, systemImage: String) {
        self.init {
            LocText(locTitleKey)
        } icon: {
            Image(systemName: systemImage)
        }
    }

    init(locTitleKey: String, image: String) {
        self.init {
            LocText(locTitleKey)
        } icon: {
            Image(image)
        }
    }
}

// MARK: - Toggle -

public extension Toggle where Label == LocText {
    init(isOn: Binding<Bool>, locTitleKey: String) {
        self.init(isOn: isOn) {
            LocText(locTitleKey)
        }
    }
}

// MARK: - TextField -

@available(iOS 15.0, *)
public extension TextField where Label == LocText {
    init(text: Binding<String>, locPlaceholderKey: String) {
        self.init(text: text) {
            LocText(locPlaceholderKey)
        }
    }

    init(text: Binding<String>, formatter: Formatter, locPlaceholderKey: String) {
        self.init(value: text, formatter: formatter) {
            LocText(locPlaceholderKey)
        }
    }

    init<F>(_ value: Binding<F.FormatInput?>, format: F, locPlaceholderKey: String) where F : ParseableFormatStyle, F.FormatOutput == String {
        self.init(value: value, format: format) {
            LocText(locPlaceholderKey)
        }
    }
}
