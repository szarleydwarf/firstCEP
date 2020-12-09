//
//  AccountModel.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 18/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

struct AccountList: Decodable {
    var accounts:[Account]?
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
//    let currency, openingDate: String?
//    let transactions:[Transaction]
}

struct Transaction: Decodable {
    let from, dataOfTransaction: String?
    let amount: Double?
    let type, currency, recipient: String?
}
