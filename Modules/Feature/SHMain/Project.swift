import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.featureFramework(
    name: "SHMain", 
    dependencies: [
        .project(target: "SHDesignSystem", path: "../../Core/SHDesignSystem"),
        .project(target: "SHSmartBlocksApi", path: "../SHSmartBlocks"),
    ]
)