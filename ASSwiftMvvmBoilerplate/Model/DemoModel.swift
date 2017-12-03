//
//  DemoModel.swift
//  ASMVVMBoilerplate
//
//  Created by Amit Sen on 11/21/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import UIKit
import ObjectMapper

class DemoModel: BaseModel, Mappable {
    private struct Key {
    }
    
    required internal init(map: Map) {
        super.init()
        mapping(map: map)
    }
    
    internal func mapping(map: Map) {
        let baseKey = BaseKey.init()
        
        let key = Key.init()
    }
}
