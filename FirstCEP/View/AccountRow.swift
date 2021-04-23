//
//  AccountRow.swift
//  FirstCEP
//
//  Created by The App Experts on 19/04/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import SwiftUI

struct AccountRow: View {
    let account: Account
    let imageNames: [String: String] = [
        "loan": "pencil.circle",
        "current": "scribble",
        "savings": "book",
        "term": "lock.doc",
        "d": "paperlane"
    ]
    var body: some View {
        HStack {
            ForEach(1..<imageNames.count) { key in
                Text("RO \(key)")
            }
            VStack(alignment: .trailing) {
                Text(account.getName())
                    .font(.headline)
                    .background(Color.yellow)
                Text(account.getNumber())
                    .font(.body)
            }
            .padding(8)
        }
    }
}

struct AccountRow_Previews: PreviewProvider {
    static var previews: some View {
        AccountRow(account: Account.example)
    }
}
