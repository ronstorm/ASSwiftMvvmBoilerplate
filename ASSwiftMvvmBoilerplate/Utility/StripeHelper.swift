//
//  StripeHelper.swift
//  ASMVVMBoilerplate
//
//  Created by Amit Sen on 11/17/17.
//  Copyright © 2017 Amit Sen. All rights reserved.
//

import Foundation
import Stripe

public class StripeHelper {
    var name: String = ""
    var cardNo: String = ""
    var cvv: String = ""
    var expiryDate: String = ""
    
    private var month: UInt?
    private var year: UInt?
    
    let loader = Loader.init()
    
    init(name: String, cardNo: String, cvv: String, expiryDate: String) {
        self.name = name
        self.cardNo = cardNo
        self.cvv = cvv
        self.expiryDate = expiryDate
    }
    
    func parseMonthAndYear(fromDate expiryDate: String) {
        let dateArr = expiryDate.components(separatedBy: "/")
        
        let month = dateArr[0]
        let year = dateArr[1]
        
        self.month = UInt(month)
        self.year = UInt(year)
    }
    
    func getStripeToken(onSuccess successCallBack: @escaping(String) -> (), onError errorCallBack: @escaping(String) -> ()) {
        print("Get Stripe Token")
        
        parseMonthAndYear(fromDate: self.expiryDate)
        
        let cardParams = STPCardParams()
        
        cardParams.name = self.name
        cardParams.number = self.cardNo
        cardParams.cvc = self.cvv
        cardParams.expMonth = self.month!
        cardParams.expYear = self.year!
        
        print("\(cardParams)")
        
        loader.show()
        
        STPAPIClient.shared().createToken(withCard: cardParams) { (token, error) in
            
            self.loader.hide()
            
            if let error = error {
                // show the error to the user
                errorCallBack(error.localizedDescription)
                
            } else if let token = token {
                print("Stripe Token: \(token)")
                
                successCallBack("\(token)")
            }
        }
    }
}
