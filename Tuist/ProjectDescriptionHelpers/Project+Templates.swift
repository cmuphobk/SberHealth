import ProjectDescription

extension Project {
    
    public static func coreFramework(name: String, dependencies: [TargetDependency] = []) -> Project {
        return Project(
            name: name,
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: .staticFramework,
                    bundleId: "ru.SberHealth.\(name)",
                    infoPlist: .extendingDefault(with: [:]),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    dependencies: dependencies
                ),
            ]
        )
    }
                
    public static func featureFramework(name: String, dependencies: [TargetDependency] = []) -> Project {
        return Project(
            name: name,
            targets: [
                Target(
                    name: "\(name)Api",
                    platform: .iOS,
                    product: .staticFramework,
                    bundleId: "ru.SberHealth.\(name)Api",
                    infoPlist: .extendingDefault(with: [:]),
                    sources: ["Api/**"],
                    dependencies: dependencies
                ),
                Target(
                    name: name,
                    platform: .iOS,
                    product: .staticFramework,
                    bundleId: "ru.SberHealth.\(name)",
                    infoPlist: .extendingDefault(with: [:]),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    dependencies: dependencies + [.project(target: "\(name)Api", path: "../\(name)"),]
                ),
            ]
        )
    }
}
