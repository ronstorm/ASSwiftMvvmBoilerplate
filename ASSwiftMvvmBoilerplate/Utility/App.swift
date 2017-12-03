//
//  App.swift
//  ASMVVMBoilerplate
//
//  This is a singleton class which have all the instances of objects that will be needed throughout the app.
//
//  Created by Amit Sen on 11/11/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift

public class App {
    
    let baseURL = "Your Base Url"
    let STRIPE_API_KEY = "Your Stripe API Key"
    let host = "Your host address for the APIs"
    
    static let sharedInstance = App()
    
    let texts = Constants.Texts.init()
    let colors = Constants.Color.init()
    let regex = Constants.Regex.init()
    let timeFormats = Constants.TimeFormats.init()
    let fonts = Constants.Fonts.init()
    let apiPaths = Constants.APIPaths.init()
    let errorManager = ErrorManager.init()
    let alert = Alert.init()
    let userDefaultsManager = UserDefaultsManager.init()
    let validityManager = ValidityManager.init()
    let uiHelper = UIHelper.init()
    let dataStoreManager = DataStoreManager.init()
    let vivid = Vivid.init()
    let dateTimeHelper = DateTimeHelper.init()
    let mockDataManager = MockDataManager.init()
    let viewControllerHelper = ViewControllerHelper.init()
    
    var networkManager: NetworkManager!
    var pushNotificationManager: PushNotificationManager!
    
    
    private init() {
        
    }
    
    func initialize(application: UIApplication) {
        
        IQKeyboardManager.sharedManager().enable = true
        networkManager = NetworkManager(host: host, baseURL: baseURL)
        pushNotificationManager = PushNotificationManager(application: application)
    }
}
