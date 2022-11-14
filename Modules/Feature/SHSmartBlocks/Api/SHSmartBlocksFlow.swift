import UIKit
import SHStoriesApi

public protocol SHSmartBlocksDependencies {
    func makeStories() -> SHStoriesFlow
}

public protocol SHSmartBlocksFlow {
    func make() -> UIViewController
}
