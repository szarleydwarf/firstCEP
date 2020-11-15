//
//  Account.swift
//  FirstCEP
//
//  Created by The App Experts on 14/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

struct Accounts :Decodable{
    let accounts:[Account]
}

struct Account:Decodable {
    let kind:String?
    let title:String?
    let number:String?
    let balance:Double?
    let currency:String?
}
