//
//  Transactions.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 22/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

struct AllTransactions:Decodable {
    let allTransactions:String
    
    enum CodingKeys: String, CodingKey {
        case allTransactions = "all_transactions"
    }
}

struct accountTransactions:Decodable {
    let senderAccount:String
    let transactions: [Transactions]
    
    enum CodingKeys: String, CodingKey {
        case senderAccount = "sender_account"
        case transactions
    }
}

struct Transactions: Decodable {
    let dateOfTransaction:String
    let amount:String
    let type:String
    let currency:String
    let recipient:String
    
    enum CodingKeys: String, CodingKey {
        case dateOfTransaction = "data_of_transaction"
        case amount
        case type
        case currency
        case recipient
    }
}
