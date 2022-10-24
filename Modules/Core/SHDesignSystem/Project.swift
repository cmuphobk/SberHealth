import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.featureFramework(
    name: "SHDesignSystem", 
    dependencies: [
        .project(target: "SHFoundation", path: "../SHFoundation"),
    ]
)