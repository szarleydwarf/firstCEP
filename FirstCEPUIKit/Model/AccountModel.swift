//
//  AccountModel.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 18/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

struct AccountList: Decodable {
    let accounts:[Account]?
}

struct Account: Decodable {
    enum AccountKind: String {
        case current
        case savings
        case term
        case loan
    }
    
    let kind, title, number: String?
    let balance: Double?
    let currency, openingDate: String?

    
    func getBalance() ->String {
        var currencySymbol = self.currency ?? "GBP"
        guard let balance = self.balance else {return ""}
        if let currency = self.currency {
            currencySymbol = getCurrencySymbol(from: currency)
        }
        return currencySymbol + " " + String(format:"%.2f", locale: Locale.current, balance)
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
