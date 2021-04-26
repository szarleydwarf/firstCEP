//
//  Transfer.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import Foundation

class Transfer: ObservableObject {
    @Published var accounts = (sender: Account(kind: "CURRENT", title: "LOAN",
   number: "1213 3435 7745", balance: 1234.44,
   currency: "GBP"),
   reciever: Account(kind: "CURRENT", title: "LOAN",
   number: "1213 3435 7745", balance: 1234.44, currency: "GBP"))

    func doTransfer ( betwenn accounts: (Account, Account)) -> Bool {
        print("transfer > \(accounts.0) <> \(accounts.1)")
        return false
    }
}
