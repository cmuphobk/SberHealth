//
//  SHSmartBlocks.swift
//  SHSmartBlocks
//
//  Created by docdoc on 24.10.2022.
//

import UIKit
import SHDesignSystem
import SHSmartBlocksApi

public final class SHSmartBlocksFlowImpl: SHSmartBlocksFlow {
    private let dependencies: SHSmartBlocksDependencies
    public init(dependencies: SHSmartBlocksDependencies) {
        self.dependencies = dependencies
    }
    public func make() -> UIViewController {
        let vc = SHSmartBlockViewController()
        vc.dependencies = dependencies
        return vc
    }
}

private final class SHSmartBlockViewController: UIViewController {
    var dependencies: SHSmartBlocksDependencies?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let item = UIBarButtonItem(
            image: Illustration.stories.illustration,
            style: .plain,
            target: self,
            action: #selector(buttonDidTapped(_:))
        )
        item.tintColor = .blue
        navigationItem.rightBarButtonItem = item
    }
    
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        dependencies.flatMap { pushImplicity($0.makeStories().make()) }
    }
}
