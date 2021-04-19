//
//  AccountRow.swift
//  FirstCEP
//
//  Created by The App Experts on 19/04/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import SwiftUI

struct AccountRow: View {
    let account:Account
    
    var body: some View {
        HStack {
            if account.kind == "loan" {
                Image(systemName: "pencil.circle")
            } else if account.kind == "current" {
                Image(systemName: "scribble")
            } else if account.kind == "savings" {
                Image(systemName: "book")
            } else if account.kind == "term" {
                Image(systemName: "lock.doc")
            } else {
                Image(systemName: "paperplane")
            }
            Text(account.getName())

        }
    }
}

struct AccountRow_Previews: PreviewProvider {
    static var previews: some View {
        AccountRow(account: Account.example)
    }
}
