import ProjectDescription

extension Project {
  public static func featureFramework(name: String, dependencies: [TargetDependency] = []) -> Project {
    return Project(
        name: name,
        targets: [
            Target(
                name: name,
                platform: .iOS,
                product: .framework,
                bundleId: "ru.SberHealth.\(name)",
                infoPlist: "Info.plist",
                sources: ["Sources/**"],
                resources: ["Resources/**",],
                dependencies: dependencies
            )
        ]
    )
  }
}