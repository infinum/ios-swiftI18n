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
    init(key: String, @ViewBuilder content: @escaping () -> Content) {
        self.init {
            content()
        } label: {
            LocText(key)
        }
    }
}

// MARK: - Button -

public extension Button where Label == LocText {
    init(key: String, action: @escaping () -> Void) {
        self.init(action: action) {
            LocText(key)
        }
    }

    @available(iOS 15.0, *)
    init(role: ButtonRole?, key: String, action: @escaping () -> Void) {
        self.init(role: role, action: action) {
            LocText(key)
        }
    }
}

// MARK: - Label -

@available(iOS 14.0, *)
public extension Label where Title == LocText, Icon == EmptyView {
    init(key: String) {
        self.init {
            LocText(key)
        } icon: {
            EmptyView()
        }
    }
}

@available(iOS 14.0, *)
public extension Label where Title == LocText, Icon == Image {
    init(key: String, systemImage: String) {
        self.init {
            LocText(key)
        } icon: {
            Image(systemName: systemImage)
        }
    }

    init(key: String, image: String) {
        self.init {
            LocText(key)
        } icon: {
            Image(image)
        }
    }
}

// MARK: - Toggle -

public extension Toggle where Label == LocText {
    init(isOn: Binding<Bool>, key: String) {
        self.init(isOn: isOn) {
            LocText(key)
        }
    }
}

// MARK: - TextField -

@available(iOS 15.0, *)
public extension TextField where Label == LocText {
    init(text: Binding<String>, placeholder: String) {
        self.init(text: text) {
            LocText(placeholder)
        }
    }

    init(text: Binding<String>, formatter: Formatter, placeholder: String) {
        self.init(value: text, formatter: formatter) {
            LocText(placeholder)
        }
    }

    init<F>(_ value: Binding<F.FormatInput?>, format: F, placeholder: String) where F : ParseableFormatStyle, F.FormatOutput == String {
        self.init(value: value, format: format) {
            LocText(placeholder)
        }
    }
}
