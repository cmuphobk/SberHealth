//
//  ViewController.swift
//  SberHealth
//
//  Created by docdoc on 24.10.2022.
//

import UIKit
import SHDesignSystem

import SHMainApi
import SHMain
import SHSmartBlocksApi
import SHSmartBlocks
import SHStoriesApi
import SHStories

final class Dependencies: SHMainDependencies, SHSmartBlocksDependencies, SHStoriesDependencies {
    static var shared: Dependencies { .init() }
    private init() { }

    func makeMain() -> SHMainFlow {
        SHMainFlowImpl(dependencies: self)
    }
    func makeSmartBlocks() -> SHSmartBlocksFlow {
        SHSmartBlocksFlowImpl(dependencies: self)
    }
    func makeStories() -> SHStoriesFlow {
        SHStoriesFlowImpl(dependencies: self)
    }
}

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let item = UIBarButtonItem(
            image: Illustration.main.illustration,
            style: .plain,
            target: self,
            action: #selector(buttonDidTapped(_:))
        )
        item.tintColor = .blue
        navigationItem.rightBarButtonItem = item
    }
    
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        pushImplicity(Dependencies.shared.makeMain().make())
    }

}

