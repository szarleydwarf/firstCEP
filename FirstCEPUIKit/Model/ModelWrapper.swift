//
//  ModelWrapper.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 27/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

struct Wrapper: Decodable {
    let accounts:[Account]?
    let transactions: [Transaction]?
}
