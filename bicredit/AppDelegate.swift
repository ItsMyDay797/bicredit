//
//  AppDelegate.swift
//  bicredit
//
//  Created by Марк Русаков on 14.01.25.
//

import UIKit
import WalletConnectNetworking
import WalletConnectPairing
import WalletConnectUtils


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let metadata = AppMetadata(
            name: "BiCredit App",
            description: "Decentralized lending app",
            url: URL(string: "https://bicredit.app")!,
            icons: [URL(string: "https://bicredit.app/icon.png")!]
        )

        let pairingClient = PairingClientFactory.create(metadata: metadata)

        return true
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

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        pairingClient.handle(url: url)
        return true
    }

}

