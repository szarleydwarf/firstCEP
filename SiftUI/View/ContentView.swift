//
//  ContentView.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import SwiftUI

struct ContentView: View {
    let accounts: [Account] = ViewModel().getData(from: "Accounts")
    @EnvironmentObject var account: AccountPublisher

    var body: some View {
        NavigationView {
            List {
                ForEach(accounts) { account in
                    NavigationLink(destination: AccountDetailView()) {
                        AccountRow(account: account)
                            .onTapGesture {
                                self.setAccount(account: account)
                            }
                    }
                }
            }
            .navigationBarTitle("Accounts", displayMode: .large)
        }
    }

    func setAccount(account: Account) {
        self.account.account = account
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AccountPublisher())
    }
}
