//
//  Transactions.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 22/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

struct Transactions: Decodable {
    let transactions: [Transaction]
}


struct Transaction: Decodable {
    let from:String?
    let dateOfTransaction:String?
//    let amount:String
//    let type:String
//    let currency:String
//    let recipient:String
    
}
