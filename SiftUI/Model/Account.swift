//
//  Account.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import Foundation

struct Account: Decodable, Hashable, Identifiable {
    var id = UUID()
    var kind: String?
    var title: String?
    var number: String?
    var balance: Double?
    var currency: String?
    var goal: Double?

    enum CodingKeys: String, CodingKey {
        case kind, title, number, balance, currency, goal
    }

    #if DEBUG
    static var example = Account(kind: "CURRENT", title: "LOAN",
                                 number: "1213 3435 7745", balance: 1234.44, currency: "GBP", goal: 0)
    #endif
}
