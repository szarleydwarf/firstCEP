//
//  ModelTest.swift
//  FirstCEPTests
//
//  Created by The App Experts on 14/11/2020.
//  Copyright © 2020 The App Experts. All rights reserved.
//

import XCTest
@testable import FirstCEP

class ModelTest: XCTestCase {
    func modelShouldReturnNil() {
        // Given

        // When
        let account = Account(kind: nil, title: nil, number: nil, balance: nil, currency: nil)
        // Then
        XCTAssertNil(account, "account should generate nil without values")
    }

    func modelNotNil() {
        let account = Account(kind: "", title: "", number: "", balance: 0.0, currency: "")

        XCTAssertNotNil(account, "account should be not nil")
    }

    func modelKindNotEmpty() {
        let account = Account(kind: "current", title: "joint",
                              number: "GB 10 1010 2090 7777", balance: 12300.0, currency: "GBP")
        guard let kind = account.kind else {return}
        XCTAssertTrue(!kind.isEmpty, "Kind field should not be empty")
    }

    func modelTitleNotEmpty() {
        let account = Account(kind: "current", title: "joint",
                              number: "GB 10 1010 2090 7777", balance: 12300.0, currency: "GBP")
        guard let title = account.title else {return}
        XCTAssertTrue(!title.isEmpty, "Title field should not be empty")
    }

    func modelNumberNotEmpty() {
        let account = Account(kind: "current", title: "joint",
                              number: "GB 10 1010 2090 7777", balance: 12300.0, currency: "GBP")
        guard let number = account.number else {return}
        XCTAssertTrue(!number.isEmpty, "Number field should not be empty")
    }

    func modelBalanceNotZero() {
        let account = Account(kind: "current", title: "joint",
                              number: "GB 10 1010 2090 7777", balance: 12300.0, currency: "GBP")
        guard let balance = account.balance else {return}
        XCTAssertTrue(balance > 0, "Balance field should be above zero")
    }

    func modelCurrencyNotEmpty() {
        let account = Account(kind: "current", title: "joint",
                              number: "GB 10 1010 2090 7777", balance: 12300.0, currency: "GBP")
        guard let currency = account.currency else {return}
        XCTAssertTrue(!currency.isEmpty, "Currency field should not be empty")
    }

}
