//
//  ViewController.swift
//  SberHealth
//
//  Created by docdoc on 24.10.2022.
//

import UIKit
import SHDesignSystem
import SHMain

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
        pushImplicity(SHMainFlowImpl().make())
    }

}

