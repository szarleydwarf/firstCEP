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
                        number: "", balance: 0.00, currency: ""),
        reciever: Account(kind: "", title: "",
                          number: "", balance: 0.0, currency: ""))
    
    func doTransfer ( betwenn accounts: (Account, Account)) -> Bool {
        print("transfer > \(accounts.0) <> \(accounts.1)")
        return false
    }
    #if DEBUG
    static let example = Transfer()
    #endif
}
