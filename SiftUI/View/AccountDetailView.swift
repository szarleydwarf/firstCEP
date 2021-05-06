//
//  AccountDetailView.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import SwiftUI

struct AccountDetailView: View {
    let account: Account
    @EnvironmentObject var transfer: Transfer

    var body: some View {
        VStack {
            CircularView()
            Image(systemName: ViewModel().imageName(kind: account.kind))
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(8)
            Text(account.getName())
                .font(.title2)
                .foregroundColor(.green)
            Text(account.getNumber())
                .font(.title3)
                .foregroundColor(.gray)
            Text(account.getBalance())
                .font(.title)
                .foregroundColor(.blue)
        }
        .navigationTitle(account.kind?.uppercased() ?? "Current")
        .navigationBarTitleDisplayMode(.inline)
        .padding(10)

        VStack {
            ButtonView(buttonText: "Send money from - ",
                       imageName: "arrowshape.turn.up.right.fill", account: account)
                .padding(6)
            ButtonView(buttonText: "Send money to - ",
                       imageName: "arrowshape.turn.up.left.fill", account: account)
                .padding(6)
        }
        Spacer()
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountDetailView(account: Account.example)
                .environmentObject(Transfer())
        }
    }
}
