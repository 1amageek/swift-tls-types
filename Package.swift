// swift-tools-version: 6.4

import PackageDescription

let lifetimeSettings: [SwiftSetting] = [
    .enableExperimentalFeature("Lifetimes"),
    .enableExperimentalFeature("LifetimeDependence"),
    .enableExperimentalFeature("NonescapableTypes"),
]

let package = Package(
    name: "swift-tls-types",
    products: [
        .library(name: "TLSTypes", targets: ["TLSTypes"]),
    ],
    targets: [
        .target(name: "TLSTypes", swiftSettings: lifetimeSettings),
        .testTarget(
            name: "TLSTypesTests",
            dependencies: ["TLSTypes"],
            swiftSettings: lifetimeSettings
        ),
    ]
)
