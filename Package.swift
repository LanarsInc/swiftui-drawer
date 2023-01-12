// swift-tools-version: 5.7

import PackageDescription

let package = Package(
  name: "Drawer",
  platforms: [
    .iOS(.v16),
  ],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "Drawer",
      targets: ["Drawer"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Drawer",
      dependencies: []
    )
  ]
)
