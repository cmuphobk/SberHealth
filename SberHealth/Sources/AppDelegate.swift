//
//  AppDelegate.swift
//  SberHealth
//
//  Created by docdoc on 24.10.2022.
//

import UIKit
import SHFoundation

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SHFoundation.initialize(environment: .production)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        return true
    }
}
