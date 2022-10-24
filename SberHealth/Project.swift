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
            infoPlist: .extendingDefault(with: ["UILaunchStoryboardName":"LaunchScreen"]),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(target: "SHFoundation", path: "../Modules/Core/SHFoundation"),
                .project(target: "SHDesignSystem", path: "../Modules/Core/SHDesignSystem"),
                .project(target: "SHStoriesApi", path: "../Modules/Feature/SHStories"),
                .project(target: "SHSmartBlocksApi", path: "../Modules/Feature/SHSmartBlocks"),
                .project(target: "SHMainApi", path: "../Modules/Feature/SHMain"),
                .project(target: "SHSmartBlocks", path: "../Modules/Feature/SHSmartBlocks"),
                .project(target: "SHStories", path: "../Modules/Feature/SHStories"),
                .project(target: "SHMain", path: "../Modules/Feature/SHMain"),
            ]
        )
    ],
    schemes: [
        Scheme(
            name: "SberHealth-Post",
            shared: true,
            buildAction: BuildAction(
                targets: ["SberHealth"],
                postActions: [
                    ExecutionAction(scriptText: "bundle exec xcode-build-times generate --events-file .timings.xcode")
                ]
            )
        ),
    ]
)
