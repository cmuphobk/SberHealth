//
//  SHStories.swift
//  SHStories
//
//  Created by docdoc on 24.10.2022.
//

import UIKit
import SHDesignSystem

public protocol SHStoriesFlow {
    func make() -> UIViewController
}

public final class SHStoriesFlowImpl: SHStoriesFlow {
    public init() { }
    public func make() -> UIViewController {
        SHStoriesViewController()
    }
}

private final class SHStoriesViewController: UIViewController {
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
