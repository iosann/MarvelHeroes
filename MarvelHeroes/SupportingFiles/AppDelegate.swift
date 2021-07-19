//
//  AppDelegate.swift
//  MarvelHeroes
//
//  Created by Anna Belousova on 11.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let viewController = Factory().getCharacterViewController()
		let navigationRoot = UINavigationController(rootViewController: viewController)
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = navigationRoot
		window?.makeKeyAndVisible()
		return true
	}
}

