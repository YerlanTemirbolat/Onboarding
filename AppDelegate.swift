//
//  AppDelegate.swift
//  Registration
//
//  Created by Admin on 1/25/21.
//

import OZLivenessSDK
import Firebase
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    let login = "aleksandr.kokshin@sberbank.kz"
    let password = "yWrUKSx"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 11.0, *) {
            OZSDK.authToken = "eyJpdiI6Ijc3Z2ZndXgwQ1F6N0JvbWxJckttVUE9PSIsInZhbHVlIjoiVmh3dERRaHVaY21wMmZtcXBYWTRrUHdiOTVQbWtUbGNIdDdZXC9vcjRrUlwvdHFBd0Y1WXNNbWtcLzI2dGtBbXJxOSIsIm1hYyI6ImI4ZDVjZjJmYmJjN2U1ODdkNTNmZDg3YmFmN2FjZWVlMWZhYTE4M2Q3NjgwN2JiOTkwZDNjZjNjODdhYzViMmQifQ%3D%3D"
        } else {
            // Fallback on earlier versions
        }
        
        if #available(iOS 11.0, *) {
            OZSDK.login(login, password: password) { (token, error) in
                if let token = token {
                    OZSDK.authToken = token
                }
            }
        } else {
            // Fallback on earlier versions
        }
        
        FirebaseApp.configure()
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
}

