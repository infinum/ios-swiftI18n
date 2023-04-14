// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.


import PackageDescription
let package = Package(
  name: "SwiftI18n",
  platforms: [
    .iOS(.v11)
  ],
  products: [
  // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
        name: "I18n",
        targets: ["I18n"]
    )
  ],
  dependencies: [],
  targets: [
  // Targets are the basic building blocks of a package. A target can define a module or a test suite.
  // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
        name: "I18n",
        path: "SwiftI18n",
        exclude: ["Polyglot/PolyglotSwiftI18Extensions.swift"],
        sources: ["./Classes/Main/", "./Classes/Case/", "./Classes/Views/BaseViews/", "./Classes/Views/CaseViews/"]
    )
  ]
)
