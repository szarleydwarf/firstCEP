//
//  Account.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import Foundation

struct Account: Decodable, Hashable, Identifiable {
    let id = UUID()
    let kind: String?
    let title: String?
    let number: String?
    let balance: Double?
    let currency: String?

    enum CodingKeys: String, CodingKey {
        case kind, title, number, balance, currency
    }

    func getBalance() -> String {
        guard let currency = self.currency, let balance = self.balance else {return ""}
        return currency + " " + String(balance)
    }

    func getName() -> String {
        guard let kind = self.kind, let title = self.title else {return ""}
        return kind + " " + title
    }

    func getNumber() -> String {
        guard let number = self.number else {return ""}
        return number
    }

    #if DEBUG
    static let example = Account(kind: "CURRENT", title: "LOAN",
                                 number: "1213 3435 7745", balance: 1234.44, currency: "GBP")
    #endif
}
