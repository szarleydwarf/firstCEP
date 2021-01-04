//
//  ViewModel.swift
//  FirstCEPUIKit
//
//  Created by The App Experts on 01/12/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import Foundation
import UIKit

class ViewModel:NSObject {
    private let service:APIServices?
    private let placeholder = "https://my-json-server.typicode.com/szarleydwarf/firstCEP/master/db/accounts"
    let fileName = "Accounts"
    var accounts:AccountList = AccountList()
    
    override init() {
        self.service = APIServices()
        
        if let service = self.service {
            service.fetchFromRESTAPIGeneric(type: [Account].self, from: placeholder) { acc in
                if let accountList = acc, !accountList.isEmpty{
//                    self.accounts.accounts = accountList
                }
            }
        }
        print("VM> \(self.accounts.accounts)")
    }
    
    func getAccounts(completion: @escaping(AccountList?) -> Void) {
        if let service = service {
//          normal version, REST
//            service.fetchFromRESTAPI(from: placeholder) {[weak self] accounts in
//                if !accounts.isEmpty {
//                    self?.accounts?.accounts = accounts
//                    completion(self?.accounts)
//                }
//            }
            
//          generic version, REST
            service.fetchFromRESTAPIGeneric(type: [Account].self, from: placeholder) {[weak self] accounts in
                if let accountsList = accounts, !accountsList.isEmpty {
                    self?.accounts.accounts = accountsList
                    completion(self?.accounts)
                }
            }
        }
    }
    //    func getAccounts() -> AccountList? {
    //        if let service = service {
    //            normal version, local file
    //            let accountsList = service.fetchFromLocalFile(from: fileName)
    //            if !accountsList.isEmpty {
    //                self.accounts?.accounts = accountsList
    //            }
    
    //          generic version, local file
    //            let accountsList = service.fetchFromLocalFileGeneric(type: AccountList.self, from: fileName)
    //            if let accounts = accountsList?.accounts, !accounts.isEmpty {
    //                self.accounts?.accounts = accounts
    //            }
    
    //        }
    //        return self.accounts
    //    }
    
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
    
    func getTextToDisplay(from firstString:String?, secondString:String? = "", thirdString: String? = "")->String {
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
    
    func getTextColor(type:String?) -> UIColor{
        if type == "DB" {
            return .red
        } else {
            return .green
        }
    }
    
    func displayDetailsView(navigation:UINavigationController ,_ account: Account) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsView = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsView.account = account
        navigation.pushViewController(detailsView, animated: true)
    }
}
