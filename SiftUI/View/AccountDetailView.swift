//
//  AccountDetailView.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import SwiftUI

struct AccountDetailView: View {
    let account: Account
    
    var body: some View {
        VStack {
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
        NavigationView {
            NavigationLink(destination: TransferView(transfer: Transfer())) {
                ButtonView(buttonText: "Send money from this account", imageName: "arrowshape.turn.up.right.fill")
            }
        }
        Spacer()
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountDetailView(account: Account.example)
        }
    }
}
