//
//  AppDelegate.swift
//  IosProject
//
//  Created by Raphael on 07/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        let firstController = ScreenViewController(nibName: "ScreenViewController", bundle: nil)
        window.rootViewController = UINavigationController(rootViewController: firstController)
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }


}

