//
//  ErrorManager.swift
//  ASMVVMBoilerplate
//
//  Created by Amit Sen on 11/17/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import Foundation
import ReactiveKit

class ErrorManager {
    
    let errorMessage = PublishSubject<(String, String), NoError>()
    
    init() {
        _ = errorMessage.observeNext(with: { (title, text) in
            DispatchQueue.main.async {
                App.sharedInstance.alert.showErrorBanner(title: title, subTitle: text)
            }
        })
    }
}
