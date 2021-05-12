//
//  Transfer.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import Foundation

class Transfer: ObservableObject {
    @Published var accounts = (
        sender: Account(kind: "", title: "",
                        number: "", balance: 0.00, currency: "", goal: 0.0),
        reciever: Account(kind: "", title: "",
                          number: "", balance: 0.0, currency: "", goal: 0.0))

    func doTransfer ( between accounts: (Account, Account)) {
        print("transfer > \(accounts.0) <> \(accounts.1)")
    }

    func add(account: Account) {
        print("ADDED -> \(account.getName())")
    }

    #if DEBUG
    static let example = Transfer()
    #endif
}
