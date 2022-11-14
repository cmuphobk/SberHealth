import UIKit

public protocol SHStoriesDependencies { }

public protocol SHStoriesFlow {
    func make() -> UIViewController
}
