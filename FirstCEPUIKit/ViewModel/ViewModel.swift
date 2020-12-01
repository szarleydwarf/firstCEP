//
//  ViewModel.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 01/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

class ViewModel {
    
    func getCurrencySymbol(from currencyCode:String)->String {
        let result = Locale.availableIdentifiers.map { Locale(identifier: $0) }.first { $0.currencyCode == currencyCode }
        if let symbol = result?.currencySymbol {
            return symbol
        }
        return ""
    }
}
