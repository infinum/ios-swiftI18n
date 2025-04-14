//
//  AppDelegate.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 08/22/2016.
//  Copyright (c) 2016 Vlaho Poluta. All rights reserved.
//

import UIKit
import SwiftUI
import SwiftI18n

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {

        setupViewHierarchy()
        setupDefaultLanguage()

        return true
    }
}

// MARK: - Setup default language

private extension AppDelegate {

    func setupDefaultLanguage() {
        I18nManager.instance.defaultLanguage = Language.english.rawValue
        I18nManager.instance.fallbackLanguage = Language.english.rawValue
    }
}

// MARK: - Setup view hierarchy

private extension AppDelegate {

    func setupViewHierarchy() {
        let tabBarController = TabBarViewController()

        let window = UIWindow()
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }
}
