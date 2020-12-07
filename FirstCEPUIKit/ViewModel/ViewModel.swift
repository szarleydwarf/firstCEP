//
//  ViewModel.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 01/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation

class ViewModel:NSObject {
    private let service:APIServices?
    private let placeholderT = "https://my-json-server.typicode.com/szarleydwarf/firstCEP/master/db/transactions"
    private let placeholder = "https://my-json-server.typicode.com/szarleydwarf/firstCEP/master/db/accounts"
    let fileName = "Accounts"
    var accounts:AccountList?
    
    override init() {
        self.service = APIServices()
        self.accounts = AccountList()
    }
    
    func getAccounts() -> AccountList? {
        if let service = service {
            let accountsList = service.fetchFromLocalFile(from: fileName)
            if !accountsList.isEmpty {
                self.accounts?.accounts = accountsList
            }
            print("AC>AC >> \(accounts)")
        }
        return self.accounts
    }

    func getCurrencySymbol(from currencyCode:String)->String {
        let result = Locale.availableIdentifiers.map { Locale(identifier: $0) }.first { $0.currencyCode == currencyCode }
        if let symbol = result?.currencySymbol {
            return symbol
        }
        return ""
    }
    
    func formatAmount(amount:String) -> String {
        return String(format:"%.2f", locale: Locale.current, amount)
    }
}
