//
//  UserDefaultsManager.swift
//  ASMVVMBoilerplate
//
//  Created by Amit Sen on 11/17/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    private let KEY_DEVICE_TOKEN = "device_gcm_token"
    private let KEY_API_TOKEN = "api_token"
    private let KEY_PASSCODE = "passcode"
    
    init() {
        
    }
    
    func setDeviceToken(token: String) {
        UserDefaults.standard.setValue(token, forKey: self.KEY_DEVICE_TOKEN)
    }
    func getDeviceToken() -> String {
        return UserDefaults.standard.value(forKey: self.KEY_DEVICE_TOKEN) as? String ?? ""
    }
    
    func setAPIToken(token: String) {
        UserDefaults.standard.setValue(token, forKey: self.KEY_API_TOKEN)
    }
    func getAPIToken() -> String {
        return UserDefaults.standard.value(forKey: self.KEY_API_TOKEN) as? String ?? ""
    }
    
    func setPasscode(passcode: String) {
        UserDefaults.standard.setValue(passcode, forKey: self.KEY_PASSCODE)
    }
    func getPasscode() -> String {
        return UserDefaults.standard.value(forKey: self.KEY_PASSCODE) as? String ?? ""
    }
}
