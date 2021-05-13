//
//  ContentView.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import SwiftUI

struct ContentView: View {
    let accounts: [Account] = ViewModel().getData(from: "Accounts")
    @State var account: Account?
    @State private var selected = 0

    var body: some View {
        NavigationView {
            List {
                ForEach(accounts) { account in
                    self.$account = account
                    NavigationLink(destination: AccountDetailView(account: account)) {
                        AccountRow(account: account)
                    }
                }
            }
            .navigationBarTitle("Accounts", displayMode: .large)
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
