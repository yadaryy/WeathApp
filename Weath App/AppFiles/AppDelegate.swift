//
//  AppDelegate.swift
//  Weath App
//
//  Created by Yadar Tulayathamrong on 15/5/2566 BE.
//

import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

