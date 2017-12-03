//
//  ViewControllerHelper.swift
//  ASMVVMBoilerplate
//
//  Created by Amit Sen on 11/17/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerHelper {
    
    let mainSB = "Main"
    let launchScreenSB = "LaunchScreen"
    
    init() {
    }
    
    func getVC() -> ViewController {
        let vc = UIStoryboard(name: mainSB, bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        return vc
    }
    
//    func takeToLoginPage() {
//
//        let navController = UIStoryboard(name: Storyboards.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: "OnBoardNavigationController") as! OnBoardNavigationController
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        appDelegate.window?.rootViewController = navController
//        appDelegate.window?.makeKeyAndVisible()
//    }
}
