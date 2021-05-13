//
//  ContentView.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import SwiftUI

struct ContentView: View {
    let accounts: [Account] = ViewModel().getData(from: "Accounts")
    @State private var accountGoal: Int = 0
    @State private var selected = 0

    var body: some View {
        NavigationView {
            List {
                ForEach(accounts) { account in
                    NavigationLink(destination: AccountDetailView(account: account, goal: $accountGoal)) {
                        Text($accountGoal)
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
