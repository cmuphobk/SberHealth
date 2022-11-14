//
//  SHStories.swift
//  SHStories
//
//  Created by docdoc on 24.10.2022.
//

import UIKit
import SHDesignSystem
import SHStoriesApi

public final class SHStoriesFlowImpl: SHStoriesFlow {
    private let dependencies: SHStoriesDependencies
    public init(dependencies: SHStoriesDependencies) {
        self.dependencies = dependencies
    }
    public func make() -> UIViewController {
        let vc = SHStoriesViewController()
        vc.dependencies = dependencies
        return vc
    }
}

private final class SHStoriesViewController: UIViewController {
    var dependencies: SHStoriesDependencies?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let item = UIBarButtonItem(
            image: Illustration.back.illustration,
            style: .plain,
            target: self,
            action: #selector(buttonDidTapped(_:))
        )
        item.tintColor = .blue
        navigationItem.rightBarButtonItem = item
    }
    
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
