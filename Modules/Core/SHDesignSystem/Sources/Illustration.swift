//
//  ImageView.swift
//  SHDesignSystem
//
//  Created by docdoc on 24.10.2022.
//

import UIKit

public enum Illustration {
    case main
    case smartblock
    case stories
    case back
    
    public var illustration: UIImage {
        switch self {
        case .main:
            guard let main = UIImage(systemName: "person.circle") else {
                assertionFailure("Cant find image!")
                return UIImage()
            }
            return main
        case .smartblock:
            guard let smartblock = UIImage(systemName: "swift") else {
                assertionFailure("Cant find image!")
                return UIImage()
            }
            return smartblock
        case .stories:
            guard let stories = UIImage(systemName: "tropicalstorm") else {
                assertionFailure("Cant find image!")
                return UIImage()
            }
            return stories
        case .back:
            guard let back = UIImage(systemName: "arrowshape.turn.up.backward") else {
                assertionFailure("Cant find image!")
                return UIImage()
            }
            return back
        }
    }
}

public extension UIViewController {
    func pushImplicity(_ viewController: UIViewController) {
        guard let navigation = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else {
            assertionFailure("Cant found navigation controller!")
            return
        }
        navigation.pushViewController(viewController, animated: true)
    }
}
