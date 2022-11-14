//
//  SHMain.swift
//  SHMain
//
//  Created by docdoc on 24.10.2022.
//

import UIKit
import SHDesignSystem
import SHMainApi

public final class SHMainFlowImpl: SHMainFlow {
    private let dependencies: SHMainDependencies
    public init(dependencies: SHMainDependencies) { 
        self.dependencies = dependencies
    }
    public func make() -> UIViewController {
        let vc = SHMainViewController()
        vc.dependencies = dependencies
        return vc
    }
}

private final class SHMainViewController: UIViewController {
    var dependencies: SHMainDependencies?

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
        dependencies.flatMap { pushImplicity($0.makeSmartBlocks().make()) }
    }
}
