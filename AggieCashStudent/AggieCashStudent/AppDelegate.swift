//
//  AppDelegate.swift
//  AggieCashStudent
//
//  Created by Adila on 1/26/20.
//  Copyright © 2020 AggieCashStudent. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth
import SquareInAppPaymentsSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    //, GIDSignInDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        //        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        //        GIDSignIn.sharedInstance().delegate = self
        
        // Set your Square Application ID
        SQIPInAppPaymentsSDK.squareApplicationID = Constants.Square.APPLICATION_ID
        
        // Start application
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = ExampleViewController()
//        window?.makeKeyAndVisible()

        Style.setDefaults()
        return true
    }
    
    // For Google Sign In to handle the URL the app receives after authentication
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = GIDSignIn.sharedInstance().handle(url)
        return handled
        // return GIDSignIn.sharedInstance().handle(url,
        // sourceApplication:options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
        // annotation: [:])
    }
    
    // Same as above function, but for iOS 8 and older
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}

