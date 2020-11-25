//
//  AccountModel.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 18/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

struct Accounts: Decodable {
    let accounts:[Account]
}

struct Account: Decodable {
    let kind:String?
    let title:String?
    let number:String?
    let balance:Double?
    let currency:String?
    let openingDate:String?
    
    
    func getBalance() ->String {
        guard let currency = self.currency, let balance = self.balance else {return ""}
        return currency + " " + String(format:"%.2f", locale: Locale.current, balance)
    }
    
    func getName() -> String {
        guard let kind = self.kind, let title = self.title else {return ""}
        return kind + " " + title
    }
    
    func getNumber() -> String {
        guard let number = self.number else {return ""}
        return number
    }
}
