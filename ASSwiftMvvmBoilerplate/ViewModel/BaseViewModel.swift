//
//  BaseViewModel.swift
//  ASMVVMBoilerplate
//
//  Created by Amit Sen on 11/20/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import Foundation

class BaseViewModel {
    
    let app = App.sharedInstance
    
    var texts: Constants.Texts!
    var colors: Constants.Color!
    var regex: Constants.Regex!
    var timeFormats: Constants.TimeFormats!
    var fonts: Constants.Fonts!
    var apiPaths: Constants.APIPaths!
    var errorManager: ErrorManager!
    var alert: Alert!
    var userDefaultsManager: UserDefaultsManager!
    var validityManager: ValidityManager!
    var uiHelper: UIHelper!
    var dataStoreManager: DataStoreManager!
    var vivid: Vivid!
    var dateTimeHelper: DateTimeHelper!
    var mockDataManager: MockDataManager!
    var viewControllerHelper: ViewControllerHelper!
    var networkManager: NetworkManager!
    var pushNotificationManager: PushNotificationManager!
    
    init() {
        texts = app.texts
        colors = app.colors
        regex = app.regex
        timeFormats = app.timeFormats
        fonts = app.fonts
        apiPaths = app.apiPaths
        errorManager = app.errorManager
        alert = app.alert
        userDefaultsManager = app.userDefaultsManager
        validityManager = app.validityManager
        uiHelper = app.uiHelper
        dataStoreManager = app.dataStoreManager
        vivid = app.vivid
        dateTimeHelper = app.dateTimeHelper
        mockDataManager = app.mockDataManager
        viewControllerHelper = app.viewControllerHelper
        networkManager = app.networkManager
        pushNotificationManager = app.pushNotificationManager
    }
}
