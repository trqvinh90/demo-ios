//
//  AppDelegate.swift
//  demo2
//
//  Created by MAC on 8/17/20.
//  Copyright © 2020 Vinh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = WelcomeViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}

