//
//  Loader.swift
//  ASMVVMBoilerplate
//
//  Created by Amit Sen on 11/17/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import Foundation
import ARSLineProgress

class Loader {
    
    init() {
        ARSLineProgressConfiguration.backgroundViewStyle = .simple
        ARSLineProgressConfiguration.backgroundViewColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 0.8).cgColor
        ARSLineProgressConfiguration.backgroundViewDismissTransformScale = 1
    }
    
    func show() {
        DispatchQueue.main.async {
            ARSLineProgress.show()
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            if ARSLineProgress.shown {
                ARSLineProgress.hide()
            }
        }
    }
}
