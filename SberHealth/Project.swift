import ProjectDescription

let project = Project(
    name: "SberHealth",
    organizationName: "SberHealth",
    targets: [
        Target(
            name: "SberHealth",
            platform: .iOS,
            product: .app,
            bundleId: "ru.SberHealth.SberHealth",
            infoPlist: "Info.plist",
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(target: "SHFoundation", path: "../Modules/Core/SHFoundation"),
                .project(target: "SHDesignSystem", path: "../Modules/Core/SHDesignSystem"),
                .project(target: "SHMain", path: "../Modules/Feature/SHMain"),
            ]
        )
    ]
)
