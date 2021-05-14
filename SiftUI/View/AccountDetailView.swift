//
//  AccountDetailView.swift
//  SiftUI
//
//  Created by The App Experts on 26/04/2021.
//

import SwiftUI
import Combine

struct AccountDetailView: View {
    @EnvironmentObject var account: AccountPublisher
    @State var goal: Int = 0
    @EnvironmentObject var transfer: Transfer

    var body: some View {
        VStack {
            if account.getAccount().goal ?? 0 > 0 {
                CircularView(account: account.account)
                Text(account.getName())
                    .font(.title2)
                    .foregroundColor(.green)
                Text(account.getNumber())
                    .font(.title3)
                    .foregroundColor(.gray)

                VStack {
                    ButtonView(buttonText: "Send money from - ",
                               imageName: "arrowshape.turn.up.right.fill", account: account.account)
                        .padding(6)
                    ButtonView(buttonText: "Send money to - ",
                               imageName: "arrowshape.turn.up.left.fill", account: account.account)
                        .padding(6)
                }
                Spacer()
            } else {
                GoalView(account: $account.account)
            }
            Spacer()
            Text("GOAL : \(account.getAccountGoal() ) >> \(goal)")
        }
        .navigationTitle(account.getAccountKind() )
        .navigationBarTitleDisplayMode(.inline)
        .padding(10)
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountDetailView()
                .environmentObject(Transfer())
                .environmentObject(AccountPublisher())
        }
    }
}
