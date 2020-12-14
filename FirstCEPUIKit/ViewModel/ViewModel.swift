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
        }
        return self.accounts
    }
    
    func getDisplayModel (model:Account) -> DisplayModel {
        var displayModel:DisplayModel = DisplayModel()
        if let title = model.title, let kind = model.kind {
            displayModel.title = kind + " " + title
        }
        if let number = model.number {
            displayModel.firstSubtitle = number
        }
        if let balance = model.balance, let currency = model.currency {
            displayModel.secondSubtitle = getCurrencySymbol(from: currency) + " " + formatAmount(amount: balance)
        }
        return displayModel
    }
    
    func getDisplayModel (model:Transaction) -> DisplayModel {
        var displayModel:DisplayModel = DisplayModel()
        if let recipient = model.recipient {
            displayModel.title = recipient
        }
        if let date = model.dataOfTransaction {
            displayModel.firstSubtitle = date
        }
        if let type = model.type, let currency = model.currency, let amount = model.amount {
            displayModel.secondSubtitle = type + " " + getCurrencySymbol(from: currency) + " " + formatAmount(amount: amount)
        }
        return displayModel
    }
    
    func getImageName(kind: String) -> String {
        var imageName:String = "banknote"
        switch kind {
        case Account.AccountKind.current.rawValue:
            imageName = "banknote"
        case Account.AccountKind.savings.rawValue:
            imageName = "goforward.plus"
        case Account.AccountKind.loan.rawValue:
            imageName = "gobackward.minus"
        case Account.AccountKind.term.rawValue:
            imageName = "snow"
        default:
            imageName = "banknote"
        }
        return imageName
    }

    func getTitle(from firstString:String?, secondString:String? = "", thirdString: String? = "")->String {
        var toReturn = ""
        if let first = firstString {
            toReturn += first
        }
        
        if let second = secondString {
            toReturn += " " + second
        }
        
        if let third = thirdString {
            toReturn += " " + third
        }
        return toReturn
    }
    
    func getCurrencySymbol(from currencyCode:String?)->String {
        if let currency = currencyCode {
            let result = Locale.availableIdentifiers.map { Locale(identifier: $0) }.first { $0.currencyCode == currency }
            if let symbol = result?.currencySymbol {
                return symbol
            }
        }
        return ""
    }
    
    func formatAmount(amount:Double?) -> String {
        if let amount = amount {
            return String(format:" %.2f", locale: Locale.current, amount)
        }
        return ""
    }
}
