//
//  TabBarViewController.swift
//  SwiftI18n
//
//  Created by Andrija Ostojic on 12.4.25..
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import UIKit
import SwiftUI

final class TabBarViewController: UITabBarController {

    // MARK: - Setup -

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [uiKitExampleTab, swiftUIExampleTab]
    }

    // MARK: - Tabs -

    private var uiKitExampleTab: UIViewController {
        let uiKitExampleViewController = UIKitExampleViewController()
        let uiKitTabBarItem = setupTabBarItemtem(titleKey: "first_tab_bar_item_title", imageName: "aspectratio")
        uiKitExampleViewController.tabBarItem = uiKitTabBarItem
        let navigationController = UINavigationController(rootViewController: uiKitExampleViewController)
        navigationController.navigationBar.topItem?.rightBarButtonItem = setupBarButtonItem()
        navigationController.navigationBar.topItem?.locTitleKey = "uikit_screen_title"
        return navigationController
    }

    private var swiftUIExampleTab: UIViewController {
        let swiftUIExampleViewController = UIHostingController(rootView: SwiftUIExampleView())
        let swiftUITabBarItem = setupTabBarItemtem(titleKey: "second_tab_bar_item_title", imageName: "skew")
        swiftUIExampleViewController.tabBarItem = swiftUITabBarItem
        let navigationController = UINavigationController(rootViewController: swiftUIExampleViewController)
        navigationController.navigationBar.topItem?.rightBarButtonItem = setupBarButtonItem()
        navigationController.navigationBar.topItem?.locTitleKey = "swiftui_screen_title"
        return navigationController
    }
}

// MARK: - Setup TabBar item

private extension TabBarViewController {

    func setupTabBarItemtem(titleKey: String, imageName: String) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: imageName), selectedImage: UIImage(systemName: imageName))
        tabBarItem.locTitleKey = titleKey
        return tabBarItem
    }
}

// MARK: - Setup UIBarButtonItem

private extension TabBarViewController {
    
    func setupBarButtonItem() -> UIBarButtonItem {
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(changeLanguage))
        rightBarButtonItem.locTitleKey = "change_language_button"
        return rightBarButtonItem
    }
}

// MARK: - Language change handler

private extension TabBarViewController {

    @objc
    func changeLanguage() {
        let languagePicker = UIHostingController(rootView: LanguagePickerView())
        present(languagePicker, animated: true)
    }
}
