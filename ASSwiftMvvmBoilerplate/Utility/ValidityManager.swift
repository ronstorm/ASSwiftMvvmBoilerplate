//
//  ValidityManager.swift
//  ASMVVMBoilerplate
//
//  Created by Amit Sen on 11/17/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import Foundation

class ValidityManager {
    
    init() {
        
    }
    
    func isValidEmail(emailString email: String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: email)
    }
    
    func matches(for regex: String, in text: String) -> Bool {
        
        if text.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil {
            return true
        }
        
        return false
    }
}
