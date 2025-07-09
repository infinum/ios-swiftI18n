//
//  UIKitExampleViewController.swift
//  SwiftI18n
//
//  Created by Vlaho Poluta on 08/22/2016.
//  Copyright (c) 2016 Vlaho Poluta. All rights reserved.
//

import UIKit
import SwiftUI
import SwiftI18n

class UIKitExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupLocalizedViews()
    }

    // MARK: - Subviews

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

private extension UIKitExampleViewController {

    func setupLocalizedViews() {

        // MARK: - Search bar

        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.locTitleKey = "search_bar_example"
        searchBar.locPlaceholderKey = "search_bar_example_placeholder"
        mainStackView.addArrangedSubview(searchBar)
        mainStackView.addArrangedSubview(divider)

        // MARK: - Basic label

        let basicLabel = UILabel()
        basicLabel.locTitleKey = "basic_example"
        mainStackView.addArrangedSubview(basicLabel)
        mainStackView.addArrangedSubview(divider)

        // MARK: - Text field

        let textFieldTitle = UILabel()
        textFieldTitle.locTitleKey = "text_field_title"
        textFieldTitle.font = .boldSystemFont(ofSize: 18)
        mainStackView.addArrangedSubview(textFieldTitle)
        let textField = UITextField()
        textField.backgroundColor = .lightGray.withAlphaComponent(0.2)
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.locTitleKey = "text_field_example"
        textField.locPlaceholderKey = "text_field_example_placeholder"
        mainStackView.addArrangedSubview(textField)
        mainStackView.addArrangedSubview(divider)

        // MARK: - Uppercase case transform

        let uppercaseExampleTitle = UILabel()
        uppercaseExampleTitle.locTitleKey = "uppercase_example"
        uppercaseExampleTitle.font = .boldSystemFont(ofSize: 18)
        mainStackView.addArrangedSubview(uppercaseExampleTitle)
        let uppercasedLabel = UILabel()
        uppercasedLabel.caseTransform = I18nCaseTransform.uppercased.rawValue
        uppercasedLabel.numberOfLines = 0
        uppercasedLabel.locTitleKey = "uppercased_text_example"
        mainStackView.addArrangedSubview(uppercasedLabel)
        mainStackView.addArrangedSubview(divider)

        // MARK: - Lowercase case transform

        let lowercaseExampleTitle = UILabel()
        lowercaseExampleTitle.locTitleKey = "lowercase_example_title"
        lowercaseExampleTitle.font = .boldSystemFont(ofSize: 18)
        mainStackView.addArrangedSubview(lowercaseExampleTitle)
        let lowercasedLabel = UILabel()
        lowercasedLabel.caseTransform = I18nCaseTransform.lowercased.rawValue
        lowercasedLabel.numberOfLines = 0
        lowercasedLabel.locTitleKey = "lowercased_text_example"
        mainStackView.addArrangedSubview(lowercasedLabel)
        mainStackView.addArrangedSubview(divider)

        // MARK: - Capitalized case transform

        let capitalizedExampleTitle = UILabel()
        capitalizedExampleTitle.locTitleKey = "capitalized_example_title"
        capitalizedExampleTitle.font = .boldSystemFont(ofSize: 18)
        mainStackView.addArrangedSubview(capitalizedExampleTitle)
        let capitalizedLabel = UILabel()
        capitalizedLabel.caseTransform = I18nCaseTransform.capitalized.rawValue
        capitalizedLabel.numberOfLines = 0
        capitalizedLabel.locTitleKey = "capitalized_text_example"
        mainStackView.addArrangedSubview(capitalizedLabel)
        mainStackView.addArrangedSubview(divider)

        // MARK: - Text view

        let textViewTitle = UILabel()
        textViewTitle.locTitleKey = "text_view_title"
        textViewTitle.font = .boldSystemFont(ofSize: 18)
        mainStackView.addArrangedSubview(textViewTitle)
        let textView = UITextView()
        textView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        textView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        textView.locTitleKey = "text_view_example"
        mainStackView.addArrangedSubview(textView)
    }

    var divider: UIView {
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider.backgroundColor = .lightGray.withAlphaComponent(0.8)
        return divider
    }
}

private extension UIKitExampleViewController {

    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)

        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32).isActive = true

        mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
}

