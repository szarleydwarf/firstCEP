//
//  Transactions.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 22/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation



struct Transactions: Decodable {
    let from:String
    let dateOfTransaction:String
//    let amount:String
//    let type:String
//    let currency:String
//    let recipient:String
    
    enum CodingKeys: String, CodingKey {
        case from
        case dateOfTransaction = "data_of_transaction"
//        case amount
//        case type
//        case currency
//        case recipient
    }
}
