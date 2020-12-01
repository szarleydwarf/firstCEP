//
//  Transactions.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 22/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

struct TransactionList: Decodable {
    let transactions: [Transaction]?
}


struct Transaction: Decodable {
    let from, dataOfTransaction: String?
    let amount: Double?
    let type, currency, recipient: String?    
}
