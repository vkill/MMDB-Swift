// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "MMDB",
    products: [
        .library(name: "MMDB", targets: ["MMDB"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vkill/swift-c-libmaxminddb.git", .branch("master")),
    ],
    targets: [
        .target(name: "MMDB", dependencies: ["ClibmaxminddbExtras"]),
        .testTarget(name: "MMDBTests", dependencies: ["MMDB"]),
    ]
)
