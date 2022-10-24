//
//  SHMain.swift
//  SHMain
//
//  Created by docdoc on 24.10.2022.
//

import UIKit
import SHDesignSystem
import SHSmartBlocks

public protocol SHMainFlow {
    func make() -> UIViewController
}

public final class SHMainFlowImpl: SHMainFlow {
    public init() { }
    public func make() -> UIViewController {
        SHMainViewController()
    }
}

private final class SHMainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        let item = UIBarButtonItem(
            image: Illustration.smartblock.illustration,
            style: .plain,
            target: self,
            action: #selector(buttonDidTapped(_:))
        )
        item.tintColor = .blue
        navigationItem.rightBarButtonItem = item
    }
    
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        pushImplicity(SHSmartBlocksFlowImpl().make())
    }
}
