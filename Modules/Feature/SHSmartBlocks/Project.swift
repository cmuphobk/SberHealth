import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.featureFramework(
    name: "SHSmartBlocks", 
    dependencies: [
        .project(target: "SHDesignSystem", path: "../../Core/SHDesignSystem"),
        .project(target: "SHStories", path: "../SHStories"),
    ]
)