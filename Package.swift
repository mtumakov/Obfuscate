// swift-tools-version:5.9
import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "Obfuscate",
    platforms: [
        .iOS(.v12), .macOS(.v12)
    ],
    products: [
        .library(
            name: "Obfuscate",
            targets: ["Obfuscate"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax", from: "509.0.0"),
    ],
    targets: [
        .macro(
            name: "ObfuscateMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftSyntaxBuilder", package: "swift-syntax"),
            ]
        ),
        .target(
            name: "Obfuscate",
            dependencies: ["ObfuscateMacros"]
        ),
        .testTarget(
            name: "ObfuscateTests",
            dependencies: ["Obfuscate"]),
    ]
)
