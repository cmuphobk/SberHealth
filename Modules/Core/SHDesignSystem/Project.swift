import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.coreFramework(
    name: "SHDesignSystem", 
    dependencies: [
        .project(target: "SHFoundation", path: "../SHFoundation"),
    ]
)
