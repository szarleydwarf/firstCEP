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
}
