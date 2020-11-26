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

    func getReciepient() -> String {
        guard let toFrom = self.recipient else {return "Unknown"}
        return "To/From: \(toFrom)"
    }
    
    func getDate() -> String {
        guard let date = self.dataOfTransaction else {return "0000-00-00"}
        return "Date of transaction: \(date)"
    }
    
    func getAmountCurrencyType() -> String {
        guard let typ = self.type else {return "N/A"}
        guard let sum = self.amount else {return "0.0"}
        guard let cur = self.currency else {return "£"}
        return "\(cur) \(sum) \(typ)"
    }
    
}
