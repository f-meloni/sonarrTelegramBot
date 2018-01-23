// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SonarrBot",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(
            name: "SonarrBot",
            targets: ["SonarrBot"]),
    ],
    dependencies: [
        .package(url: "https://github.com/shaneqi/ZEGBot.git", from: Version(4, 0, 0)),
        .package(url: "/Users/franco/XCodeProjects/SonarrAPI", .branch("master"))
    ],
    targets: [
        .target(
            name: "SonarrBot",
            dependencies: ["ZEGBot", "SonarrAPI"]),
        .testTarget(
            name: "SonarrBotTests",
            dependencies: ["SonarrBot"]),
    ]
)
