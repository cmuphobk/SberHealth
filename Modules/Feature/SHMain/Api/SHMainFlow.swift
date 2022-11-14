import UIKit
import SHSmartBlocksApi

public protocol SHMainDependencies {
    func makeSmartBlocks() -> SHSmartBlocksFlow
}

public protocol SHMainFlow {
    func make() -> UIViewController
}
