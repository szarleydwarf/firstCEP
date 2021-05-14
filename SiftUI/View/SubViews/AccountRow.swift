//
//  AccountRow.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import SwiftUI

struct AccountRow: View {
    let account: Account

    var body: some View {
        HStack {
            Image(systemName: ViewModel().imageName(kind: account.kind))
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.green, lineWidth: 2.0))
                .padding(10)
            VStack(alignment: .trailing) {
//                Text(account.getName())
//                    .font(.headline)
//                    .background(Color.yellow)
//                Text(account.getNumber())
//                    .font(.body)
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
