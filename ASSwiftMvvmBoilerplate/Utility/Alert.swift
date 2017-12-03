//
//  Alert.swift
//  ASMVVMBoilerplate
//
//  Created by Amit Sen on 11/17/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import Foundation
import NotificationBannerSwift
import EZAlertController

class Alert {
    init() {
    }
    
    func showSuccessBanner(title: String, subTitle: String, onClick callback: @escaping(NotificationBanner) -> ()) {
        let banner = NotificationBanner(title: title, subtitle: subTitle, style: .success)
        banner.onTap = {
            callback(banner)
        }
        banner.show()
    }
    
    func showErrorBanner(title: String, subTitle: String) {
        let banner = NotificationBanner(title: title, subtitle: subTitle, style: .danger)
        
        banner.show()
    }
    
    func showInfoBanner(title: String, subTitle: String, onClick callback: @escaping(NotificationBanner) -> ()) {
        let banner = NotificationBanner(title: title, subtitle: subTitle, style: .info)
        banner.onTap = {
            callback(banner)
        }
        banner.show()
    }
    
    func showWarningBanner(title: String, subTitle: String) {
        let banner = NotificationBanner(title: title, subtitle: subTitle, style: .warning)
        banner.show()
    }
    
    func showSimpleAlert(title: String, message: String, btnTitle: String, onBtnClicked clicked: @escaping() -> ()) {
        EZAlertController.alert(title, message: message, buttons: [btnTitle]) { (action, position) in
            clicked()
        }
    }
}
