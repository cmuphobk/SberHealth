//
//  SHSmartBlocks.swift
//  SHSmartBlocks
//
//  Created by docdoc on 24.10.2022.
//

import UIKit
import SHDesignSystem
import SHStories

public protocol SHSmartBlocksFlow {
    func make() -> UIViewController
}

public final class SHSmartBlocksFlowImpl: SHSmartBlocksFlow {
    public init() { }
    public func make() -> UIViewController {
        SHSmartBlockViewController()
    }
}

private final class SHSmartBlockViewController: UIViewController {
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
        pushImplicity(SHStoriesFlowImpl().make())
    }
}
