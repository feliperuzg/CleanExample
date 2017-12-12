//
//  AppDelegate.swift
//  CleanExample
//
//  Created by Felipe Ruz on 18-07-17.
//  Copyright © 2017 Felipe Ruz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) -> Bool {
        let rootViewController = RootViewController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
        return true
    }
}
