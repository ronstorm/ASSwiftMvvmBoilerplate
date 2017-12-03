//
//  NetworkManager.swift
//  ASMVVMBoilerplate
//
//  Created by Amit Sen on 11/17/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import Foundation
import Bond
import ASNet
import ObjectMapper

class NetworkManager {
    let loader = Loader()
    let asNet = ASNet.shared
    
    init(host: String, baseURL: String) {
        asNet.initialize(withHost: host, andBaseURL: baseURL)
    }
    
    func apiCallForObjectResponse<T: Mappable>(endpointURL url: String, httpMethod method: HTTPMethod, httpHeader header: HTTPHeader?, parameters params: Parameters?, isMultiPart multipart: Bool, filesWhenMultipart files: ImageFileArray?, returningType type: T.Type, onComplete callback: @escaping(T, Any) -> ()) {
        
        loader.show()
        
        asNet.fetchAPIDataWithJsonObjectResponse(endpointURL: url, httpMethod: method, httpHeader: header, parameters: params, isMultiPart: multipart, filesWhenMultipart: files, returningType: type) { (result) in
            
            self.loader.hide()
            
            switch result {
            case .success(let object, let json):
                callback(object, json)
                break
            case .error(let errorTitle, let errorText):
                App.sharedInstance.errorManager.errorMessage.next((errorTitle, errorText))
                break
            }
        }
    }
    
    func apiCallForArrayResponse<T: Mappable>(endpointURL url: String, httpMethod method: HTTPMethod, httpHeader header: HTTPHeader?, parameters params: Parameters?, isMultiPart multipart: Bool, filesWhenMultipart files: ImageFileArray?, returningType type: T.Type, onComplete callback: @escaping([T], Any) -> ()) {
        
        loader.show()
        
        asNet.fetchAPIDataWithJsonArrayResponse(endpointURL: url, httpMethod: method, httpHeader: header, parameters: params, isMultiPart: multipart, filesWhenMultipart: files, returningType: type) { (result) in
            
            self.loader.hide()
            
            switch result {
            case .success(let objectArray, let json):
                callback(objectArray, json)
                break
            case .error(let errorTitle, let errorText):
                App.sharedInstance.errorManager.errorMessage.next((errorTitle, errorText))
                break
            }
        }
    }
    
    func loadImage(fromUrl url : String, usingCache: Bool = true, onSuccess successCallback: @escaping(UIImage?) -> ()) {
        loader.show()
        
        asNet.loadImage(fromUrl: url, usingCache: usingCache, onSuccess: { (image) in
            self.loader.hide()
            successCallback(image)
        }) {
            self.loader.hide()
            App.sharedInstance.errorManager.errorMessage.next(("Error", "Error loading image!"))
        }
    }
}
