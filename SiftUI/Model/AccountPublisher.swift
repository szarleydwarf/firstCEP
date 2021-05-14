//
//  AccountPublisher.swift
//  SiftUI
//
//  Created by The App Experts on 14/05/2021.
//

import Foundation

class AccountPublisher: ObservableObject {
    @Published var account = Account()
    
    func getBalance() -> String {
        guard let currency = self.account.currency, let balance = self.account.balance else {return ""}
        return currency + " " + String(balance)
    }

    func getName() -> String {
        guard let kind = self.account.kind, let title = self.account.title else {return ""}
        return kind + " " + title
    }

    func getNumber() -> String {
        guard let number = self.account.number else {return ""}
        return number
    }

    func getAccountKind() -> String {
        guard let kind = self.account.kind else {return ""}
        return kind
    }
}
