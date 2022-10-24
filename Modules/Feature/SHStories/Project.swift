import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.featureFramework(
    name: "SHStories", 
    dependencies: [
        .project(target: "SHDesignSystem", path: "../../Core/SHDesignSystem"),
    ]
)